import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  eslint: {
    // Disable ESLint during builds for production deployment
    ignoreDuringBuilds: true,
  },
  typescript: {
    // Allow production builds even with TypeScript errors
    ignoreBuildErrors: false,
  },
  output: 'standalone',
  // For Vercel deployment optimization
  serverExternalPackages: ['better-sqlite3'],
};

export default nextConfig;
