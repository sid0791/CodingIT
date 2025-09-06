# How to Run CodingIT - Step by Step Guide

This guide provides complete instructions for setting up and running the CodingIT application locally.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Git** - [Download Git](https://git-scm.com/downloads)
- **Node.js** (version 18 or higher) - [Download Node.js](https://nodejs.org/)
- **npm** (comes with Node.js)

Verify your installations:
```bash
node --version  # Should be 18.0.0 or higher
npm --version   # Should be 8.0.0 or higher
git --version   # Any recent version
```

## 🚀 Quick Start

### Option A: Automated Setup (Recommended)

For the fastest setup, use our automated script:

```bash
git clone https://github.com/sid0791/CodingIT.git
cd CodingIT
chmod +x setup.sh
./setup.sh
```

The script will:
- Install all dependencies
- Create `.env.local` from template
- Run code quality checks
- Provide next steps

Then edit `.env.local` with your API keys and run `npm run dev`.

### Option B: Manual Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/sid0791/CodingIT.git
cd CodingIT
```

### Step 2: Install Dependencies

```bash
npm install
```

This will install all required packages. You may see some deprecation warnings - these are normal and don't affect functionality.

### Step 3: Set Up Environment Variables

Create a `.env.local` file in the root directory:

```bash
touch .env.local
```

Add the following configuration to `.env.local`:

```env
# Required for basic functionality
NEXT_PUBLIC_SITE_URL=http://localhost:3000

# Database & Authentication (Supabase)
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key

# Webhooks (required for production)
GITHUB_WEBHOOK_SECRET=your_github_webhook_secret
STRIPE_WEBHOOK_SECRET=your_stripe_webhook_secret

# AI Providers (add at least one)
OPENAI_API_KEY=your_openai_api_key
ANTHROPIC_API_KEY=your_anthropic_api_key
GROQ_API_KEY=your_groq_api_key
TOGETHER_API_KEY=your_together_api_key
FIREWORKS_API_KEY=your_fireworks_api_key
GOOGLE_AI_API_KEY=your_google_ai_api_key
GOOGLE_VERTEX_CREDENTIALS=your_google_vertex_credentials
MISTRAL_API_KEY=your_mistral_api_key
XAI_API_KEY=your_xai_api_key
DEEPSEEK_API_KEY=your_deepseek_api_key

# Optional: Rate limiting (Upstash KV)
KV_REST_API_URL=your_kv_rest_api_url
KV_REST_API_TOKEN=your_kv_rest_api_token

# Optional: Analytics (PostHog)
NEXT_PUBLIC_POSTHOG_KEY=your_posthog_key
NEXT_PUBLIC_POSTHOG_HOST=your_posthog_host

# Optional: Disable features
# NEXT_PUBLIC_NO_API_KEY_INPUT=true
# NEXT_PUBLIC_NO_BASE_URL_INPUT=true
# NEXT_PUBLIC_HIDE_LOCAL_MODELS=true
```

### Step 4: Start Development Server

```bash
npm run dev
```

The application will start at `http://localhost:3000`. The development server uses Turbo for faster builds.

You should see output similar to:
```
▲ Next.js 14.2.32
- Local:        http://localhost:3000
- Environments: .env.local

✓ Ready in 2.3s
```

### Step 5: Verify Installation

1. Open your browser and navigate to `http://localhost:3000`
2. You should see the CodingIT application interface with:
   - The CodinIT.dev logo and header
   - A "Star on GitHub" section
   - Model selection dropdowns (Auto mode, Claude Sonnet 3.5)
   - A text input area saying "Tell CodinIT what you want to create"
   - A clean, dark-themed interface
3. Check the browser console for any errors

![CodingIT Application Interface](https://github.com/user-attachments/assets/33887efb-3f0c-43d8-922b-eaa18b19b7fc)

## 🔧 Configuration Details

### Required Environment Variables

#### Database & Authentication
- **SUPABASE_URL** & **NEXT_PUBLIC_SUPABASE_URL**: Your Supabase project URL
- **SUPABASE_ANON_KEY** & **NEXT_PUBLIC_SUPABASE_ANON_KEY**: Your Supabase anonymous key

#### Site Configuration
- **NEXT_PUBLIC_SITE_URL**: The URL where your app is hosted (use `http://localhost:3000` for development)

#### AI Providers
At least one AI provider API key is required:
- **OPENAI_API_KEY**: OpenAI API key
- **ANTHROPIC_API_KEY**: Anthropic (Claude) API key
- **GROQ_API_KEY**: Groq API key
- **TOGETHER_API_KEY**: Together AI API key
- **FIREWORKS_API_KEY**: Fireworks AI API key
- **GOOGLE_AI_API_KEY**: Google AI Studio API key
- **MISTRAL_API_KEY**: Mistral AI API key
- **XAI_API_KEY**: xAI (Grok) API key
- **DEEPSEEK_API_KEY**: DeepSeek API key

#### Production Only
- **GITHUB_WEBHOOK_SECRET**: For GitHub integration webhooks
- **STRIPE_WEBHOOK_SECRET**: For Stripe payment webhooks

### Getting API Keys

#### Supabase Setup
1. Go to [supabase.com](https://supabase.com)
2. Create a new project
3. Go to Settings > API
4. Copy the Project URL and anon/public key

#### AI Provider Keys
- **OpenAI**: [platform.openai.com](https://platform.openai.com/api-keys)
- **Anthropic**: [console.anthropic.com](https://console.anthropic.com)
- **Groq**: [console.groq.com](https://console.groq.com)
- **Together AI**: [api.together.xyz](https://api.together.xyz)
- **Fireworks**: [fireworks.ai](https://fireworks.ai)
- **Google AI**: [makersuite.google.com](https://makersuite.google.com)
- **Mistral**: [console.mistral.ai](https://console.mistral.ai)

## 🛠️ Development Commands

```bash
# Start development server with hot reloading
npm run dev

# Build for production
npm run build

# Start production server (after build)
npm run start

# Run ESLint
npm run lint
```

## 🧪 Testing Your Setup

### 1. Check Build Process
```bash
npm run build
```

You may see environment validation warnings - these are expected if optional environment variables are not set.

### 2. Check Linting
```bash
npm run lint
```

Should show "✔ No ESLint warnings or errors"

### 3. Test Development Server
```bash
npm run dev
```

Visit `http://localhost:3000` and verify:
- Page loads without errors
- You can access the main interface
- No console errors in browser developer tools

## 🐛 Troubleshooting

### Common Issues

#### Port Already in Use
If port 3000 is busy:
```bash
npm run dev -- --port 3001
```

#### Missing Environment Variables
The app will build successfully but may show warnings. For basic functionality, you need:
1. At least one AI provider API key
2. Supabase configuration (for auth/database features)
3. NEXT_PUBLIC_SITE_URL set correctly

#### Node.js Version Issues
Ensure you're using Node.js 18 or higher:
```bash
node --version
```

#### TypeScript Warnings
You may see TypeScript version warnings during linting - these are non-blocking.

### Getting Help

- Check the browser developer console for client-side errors
- Check the terminal running `npm run dev` for server-side errors
- Ensure all required environment variables are properly set
- Verify your API keys are valid and have sufficient credits/quota

## 🚀 Production Deployment

For production deployment:

1. Set up all required environment variables on your hosting platform
2. Set `NEXT_PUBLIC_SITE_URL` to your production domain
3. Configure webhook secrets for GitHub and Stripe integrations
4. Run `npm run build` to create an optimized build
5. Deploy the `.next` folder and other required files

### Recommended Hosting Platforms
- **Vercel** (recommended for Next.js apps)
- **Netlify**
- **Railway**
- **AWS/GCP/Azure** with container deployment

## 📚 Next Steps

Once you have the application running:

1. Explore the interface and features
2. Set up your preferred AI providers
3. Configure additional integrations (GitHub, Stripe) as needed
4. Customize templates and models in the `lib/` directory
5. Review the codebase to understand the architecture

---

**Need more help?** Check the main [README.md](README.md) for additional information and configuration options.