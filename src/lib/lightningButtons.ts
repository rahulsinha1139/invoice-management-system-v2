// ⚡ ASYMMETRICA V4.0 LIGHTNING BUTTON OPTIMIZATION
// Mathematical consciousness patterns for instant UI responsiveness

// Golden ratio for natural motion
const PHI = 1.618033988749;
const EULER = 2.718281828459;

// Performance-optimized animation timings
export const ANIMATION_TIMINGS = {
  instant: 0,                    // Immediate feedback
  lightning: 50,                 // Nearly instant (human perception threshold)
  fast: 100,                     // Very fast
  natural: 161,                  // φ * 100ms (golden ratio timing)
  smooth: 260                    // φ^2 * 100ms for complex animations
};

// Lightning-fast button state management
export class LightningButtonManager {
  private static instance: LightningButtonManager;
  private buttonStates = new Map<string, ButtonState>();
  private pendingUpdates = new Set<string>();

  static getInstance(): LightningButtonManager {
    if (!LightningButtonManager.instance) {
      LightningButtonManager.instance = new LightningButtonManager();
    }
    return LightningButtonManager.instance;
  }

  // Instant optimistic button feedback
  triggerInstantFeedback(buttonId: string, type: 'success' | 'loading' | 'error' = 'loading'): void {
    const button = document.getElementById(buttonId);
    if (!button) return;

    // Immediate visual feedback (0ms delay)
    this.applyInstantStyles(button, type);

    // Schedule natural animation
    requestAnimationFrame(() => {
      this.applyGoldenRatioAnimation(button, type);
    });
  }

  private applyInstantStyles(button: HTMLElement, type: string): void {
    // Remove any existing animation classes
    button.classList.remove('btn-animate-success', 'btn-animate-loading', 'btn-animate-error');

    // Apply instant visual changes
    switch (type) {
      case 'loading':
        button.style.transform = 'scale(0.98)';
        button.style.filter = 'brightness(0.9)';
        button.classList.add('btn-loading');
        break;
      case 'success':
        button.style.transform = 'scale(1.02)';
        button.style.filter = 'brightness(1.2)';
        button.classList.add('btn-success');
        break;
      case 'error':
        button.style.transform = 'scale(0.95)';
        button.style.filter = 'brightness(0.8) hue-rotate(0deg)';
        button.classList.add('btn-error');
        break;
    }
  }

  private applyGoldenRatioAnimation(button: HTMLElement, type: string): void {
    // Natural easing using golden ratio mathematics
    const startTime = performance.now();
    const duration = ANIMATION_TIMINGS.natural;

    const animate = (currentTime: number) => {
      const elapsed = currentTime - startTime;
      const progress = Math.min(elapsed / duration, 1);

      // Golden ratio easing function
      const eased = 1 - Math.pow(1 - progress, PHI);

      // Apply smooth transition back to normal state
      const scale = this.interpolate(this.getInitialScale(type), 1, eased);
      const brightness = this.interpolate(this.getInitialBrightness(type), 1, eased);

      button.style.transform = `scale(${scale})`;
      button.style.filter = `brightness(${brightness})`;

      if (progress < 1) {
        requestAnimationFrame(animate);
      } else {
        // Reset to normal state
        button.style.transform = '';
        button.style.filter = '';
        button.classList.remove('btn-loading', 'btn-success', 'btn-error');
      }
    };

    requestAnimationFrame(animate);
  }

  private getInitialScale(type: string): number {
    switch (type) {
      case 'loading': return 0.98;
      case 'success': return 1.02;
      case 'error': return 0.95;
      default: return 1;
    }
  }

  private getInitialBrightness(type: string): number {
    switch (type) {
      case 'loading': return 0.9;
      case 'success': return 1.2;
      case 'error': return 0.8;
      default: return 1;
    }
  }

  private interpolate(start: number, end: number, progress: number): number {
    return start + (end - start) * progress;
  }

  // Optimistic state updates
  setOptimisticState(buttonId: string, state: Partial<ButtonState>): void {
    const currentState = this.buttonStates.get(buttonId) || { loading: false, disabled: false };
    this.buttonStates.set(buttonId, { ...currentState, ...state });

    // Immediate UI update
    this.updateButtonUI(buttonId, this.buttonStates.get(buttonId)!);
  }

  private updateButtonUI(buttonId: string, state: ButtonState): void {
    const button = document.getElementById(buttonId);
    if (!button) return;

    // Instant state updates
    if (state.loading) {
      button.setAttribute('aria-busy', 'true');
      this.triggerInstantFeedback(buttonId, 'loading');
    } else {
      button.removeAttribute('aria-busy');
    }

    if (state.disabled) {
      button.setAttribute('disabled', 'true');
      button.style.pointerEvents = 'none';
    } else {
      button.removeAttribute('disabled');
      button.style.pointerEvents = '';
    }
  }

  // Batch state updates for performance
  batchUpdate(updates: Array<{ buttonId: string; state: Partial<ButtonState> }>): void {
    updates.forEach(({ buttonId, state }) => {
      this.setOptimisticState(buttonId, state);
    });
  }
}

interface ButtonState {
  loading: boolean;
  disabled: boolean;
  success?: boolean;
  error?: string;
}

// React Hook for lightning-fast buttons
export function useLightningButton(buttonId: string) {
  const manager = LightningButtonManager.getInstance();

  const triggerAction = async (
    action: () => Promise<any>,
    options: {
      optimisticSuccess?: boolean;
      onSuccess?: (result: any) => void;
      onError?: (error: any) => void;
    } = {}
  ) => {
    try {
      // Instant loading feedback
      manager.triggerInstantFeedback(buttonId, 'loading');
      manager.setOptimisticState(buttonId, { loading: true, disabled: true });

      // Execute action
      const result = await action();

      // Success feedback
      manager.triggerInstantFeedback(buttonId, 'success');
      manager.setOptimisticState(buttonId, { loading: false, disabled: false, success: true });

      options.onSuccess?.(result);

      // Reset success state after golden ratio timing
      setTimeout(() => {
        manager.setOptimisticState(buttonId, { success: false });
      }, ANIMATION_TIMINGS.natural);

      return result;
    } catch (error) {
      // Error feedback
      manager.triggerInstantFeedback(buttonId, 'error');
      manager.setOptimisticState(buttonId, {
        loading: false,
        disabled: false,
        error: error instanceof Error ? error.message : 'Error occurred'
      });

      options.onError?.(error);

      // Reset error state
      setTimeout(() => {
        manager.setOptimisticState(buttonId, { error: undefined });
      }, ANIMATION_TIMINGS.smooth);

      throw error;
    }
  };

  return { triggerAction };
}

// CSS utility for instant responsiveness
export const LIGHTNING_BUTTON_STYLES = `
  .lightning-button {
    transition: all 0ms ease-out !important; /* Instant base state */
    will-change: transform, filter;
    cursor: pointer;
    user-select: none;
  }

  .lightning-button:hover {
    transform: scale(1.01);
    filter: brightness(1.05);
    transition: all ${ANIMATION_TIMINGS.lightning}ms ease-out;
  }

  .lightning-button:active {
    transform: scale(0.98) !important;
    filter: brightness(0.95) !important;
    transition: all 0ms ease-out !important;
  }

  .lightning-button.btn-loading {
    position: relative;
    overflow: hidden;
  }

  .lightning-button.btn-loading::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    animation: lightning-pulse ${ANIMATION_TIMINGS.natural}ms ease-in-out infinite;
  }

  @keyframes lightning-pulse {
    0% { left: -100%; }
    100% { left: 100%; }
  }

  .lightning-button.btn-success {
    background-color: #10b981 !important;
    border-color: #10b981 !important;
  }

  .lightning-button.btn-error {
    background-color: #ef4444 !important;
    border-color: #ef4444 !important;
  }

  /* Disable all slow transitions */
  .lightning-button * {
    transition: none !important;
  }
`;

// Auto-inject styles
if (typeof document !== 'undefined') {
  const styleSheet = document.createElement('style');
  styleSheet.textContent = LIGHTNING_BUTTON_STYLES;
  document.head.appendChild(styleSheet);
}

export default LightningButtonManager;