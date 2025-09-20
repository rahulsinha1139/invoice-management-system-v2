// Enhanced fetch utilities with timeout and error handling
export const DEFAULT_TIMEOUT = 10000; // 10 seconds

export interface FetchOptions extends RequestInit {
  timeout?: number;
}

export async function fetchWithTimeout(url: string, options: FetchOptions = {}): Promise<Response> {
  const { timeout = DEFAULT_TIMEOUT, ...fetchOptions } = options;

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeout);

  try {
    const response = await fetch(url, {
      ...fetchOptions,
      signal: controller.signal,
    });

    clearTimeout(timeoutId);
    return response;
  } catch (error) {
    clearTimeout(timeoutId);

    if (error instanceof Error) {
      if (error.name === 'AbortError') {
        throw new Error(`Request timeout after ${timeout}ms: ${url}`);
      }
      throw new Error(`Fetch failed for ${url}: ${error.message}`);
    }

    throw new Error(`Unknown fetch error for ${url}`);
  }
}

export async function apiCall<T>(url: string, options: FetchOptions = {}): Promise<T> {
  try {
    const response = await fetchWithTimeout(url, options);

    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }

    const data = await response.json();

    // Handle API response format
    if (data.success === false) {
      throw new Error(data.error || 'API request failed');
    }

    // Return the full response if it has a success field, otherwise return data portion
    if (data.success !== undefined) {
      return data;
    }

    return data;
  } catch (error) {
    console.error(`API call failed for ${url}:`, error);
    throw error;
  }
}

export async function postJSON<T>(url: string, data: any, options: FetchOptions = {}): Promise<T> {
  return apiCall<T>(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...options.headers,
    },
    body: JSON.stringify(data),
    ...options,
  });
}