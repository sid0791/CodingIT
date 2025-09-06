#!/bin/bash

# CodingIT Quick Setup Script
# This script helps you get started with CodingIT quickly

set -e

echo "🚀 CodingIT Quick Setup"
echo "======================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ from https://nodejs.org/"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18 or higher is required. Current version: $(node --version)"
    echo "Please update Node.js from https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js $(node --version) detected"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo "📝 Creating .env.local from template..."
    cp .env.local.template .env.local
    
    echo ""
    echo "⚠️  IMPORTANT: Edit .env.local with your actual API keys"
    echo "   - Add at least one AI provider API key (OpenAI, Anthropic, etc.)"
    echo "   - Configure Supabase for full functionality"
    echo "   - See RUNNING.md for detailed setup instructions"
    echo ""
else
    echo "✅ .env.local already exists"
fi

# Run linter to check code quality
echo "🔍 Running linter..."
npm run lint

echo ""
echo "🎉 Setup complete! Next steps:"
echo ""
echo "1. Edit .env.local with your API keys (see RUNNING.md for details)"
echo "2. Run: npm run dev"
echo "3. Open: http://localhost:3000"
echo ""
echo "📖 For detailed instructions, see RUNNING.md"
echo "🐛 For troubleshooting, check the browser console and terminal output"