import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // ⚡ ASYMMETRICA V4.0 PERFORMANCE OPTIMIZATIONS
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: false,
  },
  output: 'standalone',

  // 🚀 EXTREME PERFORMANCE SETTINGS
  experimental: {
    optimizeCss: true,
    optimizePackageImports: ['react', 'react-dom']
  },

  // Webpack optimizations
  webpack: (config, { dev, isServer }) => {
    if (!dev && !isServer) {
      // Production optimizations
      config.optimization.splitChunks = {
        chunks: 'all',
        minSize: 20000,
        maxSize: 244000,
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/]/,
            name: 'vendors',
            chunks: 'all',
          },
        },
      };
    }

    // Faster builds
    config.cache = {
      type: 'filesystem',
      buildDependencies: {
        config: [__filename]
      }
    };

    return config;
  },

  // Database external packages
  serverExternalPackages: ['better-sqlite3'],

  // Compression and caching
  compress: true,

  // Image optimization
  images: {
    unoptimized: false,
    formats: ['image/webp', 'image/avif']
  }
};

export default nextConfig;
