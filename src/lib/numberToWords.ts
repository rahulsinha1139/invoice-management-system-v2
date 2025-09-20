/**
 * Number to Words Conversion - Indian Currency Format
 * Converts numerical amounts to words for professional invoices
 * Based on Flask backend num2words functionality
 */

const ones = [
  "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
  "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
  "Seventeen", "Eighteen", "Nineteen"
];

const tens = [
  "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"
];

const scales = [
  "", "Thousand", "Lakh", "Crore", "Arab", "Kharab"
];

interface NumberToWordsOptions {
  currency?: string;
  locale?: 'en-IN' | 'en-US';
  includeOnly?: boolean;
}

/**
 * Converts numbers less than 1000 to words
 */
function convertHundreds(num: number): string {
  if (num === 0) return "";

  let result = "";

  if (num >= 100) {
    result += ones[Math.floor(num / 100)] + " Hundred ";
    num %= 100;
  }

  if (num >= 20) {
    result += tens[Math.floor(num / 10)] + " ";
    num %= 10;
  }

  if (num > 0) {
    result += ones[num] + " ";
  }

  return result.trim();
}

/**
 * Converts a number to words in Indian numbering system
 */
function convertToWordsIndian(num: number): string {
  if (num === 0) return "Zero";

  const groups: number[] = [];
  let tempNum = num;

  // Handle first group (thousands)
  groups.push(tempNum % 1000);
  tempNum = Math.floor(tempNum / 1000);

  // Handle remaining groups in lakhs and crores (groups of 100)
  while (tempNum > 0) {
    groups.push(tempNum % 100);
    tempNum = Math.floor(tempNum / 100);
  }

  let result = "";

  for (let i = groups.length - 1; i >= 0; i--) {
    if (groups[i] !== 0) {
      if (i === 0) {
        // Thousands group
        result += convertHundreds(groups[i]) + " ";
      } else {
        // Lakhs, crores, etc.
        if (i === 1) {
          result += convertHundreds(groups[i]) + " Thousand ";
        } else if (i === 2) {
          result += convertHundreds(groups[i]) + " Lakh ";
        } else if (i === 3) {
          result += convertHundreds(groups[i]) + " Crore ";
        } else {
          result += convertHundreds(groups[i]) + " " + scales[Math.min(i, scales.length - 1)] + " ";
        }
      }
    }
  }

  return result.trim();
}

/**
 * Main function to convert amount to words with currency
 */
export function numberToWords(
  amount: number,
  options: NumberToWordsOptions = {}
): string {
  const {
    currency = 'INR',
    locale = 'en-IN',
    includeOnly = true
  } = options;

  if (isNaN(amount) || amount < 0) {
    return "Invalid Amount";
  }

  // Handle zero
  if (amount === 0) {
    return `Zero ${currency === 'INR' ? 'Rupees' : 'Dollars'}${includeOnly ? ' Only' : ''}`;
  }

  // Split into rupees and paise
  const rupees = Math.floor(amount);
  const paise = Math.round((amount - rupees) * 100);

  let result = "";

  // Convert rupees
  if (rupees > 0) {
    result += convertToWordsIndian(rupees);

    if (currency === 'INR') {
      result += rupees === 1 ? " Rupee" : " Rupees";
    } else {
      result += rupees === 1 ? " Dollar" : " Dollars";
    }
  }

  // Convert paise/cents
  if (paise > 0) {
    if (rupees > 0) result += " and ";

    result += convertToWordsIndian(paise);

    if (currency === 'INR') {
      result += paise === 1 ? " Paisa" : " Paise";
    } else {
      result += paise === 1 ? " Cent" : " Cents";
    }
  }

  // Add "Only" at the end
  if (includeOnly) {
    result += " Only";
  }

  return result;
}

/**
 * Utility function for invoice amounts with professional formatting
 */
export function invoiceAmountToWords(amount: number): string {
  return numberToWords(amount, {
    currency: 'INR',
    locale: 'en-IN',
    includeOnly: true
  });
}

/**
 * Test function to verify conversion accuracy
 */
export function testNumberToWords(): void {
  const testCases = [
    0,
    1,
    25,
    100,
    1234,
    12345,
    123456,
    1234567,
    12345678,
    123456789,
    1234.56,
    50000.75
  ];

  console.log("Number to Words Test Cases:");
  testCases.forEach(num => {
    console.log(`${num} -> ${numberToWords(num)}`);
  });
}

/**
 * Format currency for display
 */
export function formatCurrency(amount: number): string {
  return new Intl.NumberFormat('en-IN', {
    style: 'currency',
    currency: 'INR',
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  }).format(amount);
}

/**
 * Validate amount for invoice processing
 */
export function validateAmount(amount: number): {
  isValid: boolean;
  error?: string;
} {
  if (isNaN(amount)) {
    return { isValid: false, error: "Amount must be a valid number" };
  }

  if (amount < 0) {
    return { isValid: false, error: "Amount cannot be negative" };
  }

  if (amount > 999999999999) {
    return { isValid: false, error: "Amount too large to process" };
  }

  return { isValid: true };
}