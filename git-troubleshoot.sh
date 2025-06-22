#!/bin/bash

echo "=== Git Push Troubleshooting Script ==="
echo ""

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository"
    exit 1
fi

echo "1. Checking git configuration..."
echo "--------------------------------"

# Check git user configuration
echo "Git user name: $(git config user.name)"
echo "Git user email: $(git config user.email)"
echo ""

# Check remote configuration
echo "2. Checking remote configuration..."
echo "-----------------------------------"
git remote -v
echo ""

# Check current branch
echo "3. Checking current branch..."
echo "-----------------------------"
git branch --show-current
echo ""

# Check git status
echo "4. Checking git status..."
echo "-------------------------"
git status --porcelain
echo ""

# Test SSH connection
echo "5. Testing SSH connection to GitHub..."
echo "--------------------------------------"
if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    echo "✅ SSH connection successful"
else
    echo "❌ SSH connection failed"
    echo "   This could be due to:"
    echo "   - Missing SSH key"
    echo "   - SSH key not added to GitHub"
    echo "   - SSH agent not running"
    echo ""
    echo "   To fix SSH issues:"
    echo "   1. Generate SSH key: ssh-keygen -t ed25519 -C 'your_email@example.com'"
    echo "   2. Add to SSH agent: ssh-add ~/.ssh/id_ed25519"
    echo "   3. Add public key to GitHub: cat ~/.ssh/id_ed25519.pub"
fi
echo ""

# Check for HTTPS fallback
echo "6. Testing HTTPS connection..."
echo "------------------------------"
if curl -s https://api.github.com/user > /dev/null; then
    echo "✅ HTTPS connection to GitHub successful"
else
    echo "❌ HTTPS connection failed"
fi
echo ""

# Provide solutions
echo "7. Common Solutions..."
echo "---------------------"
echo ""
echo "If SSH fails, try switching to HTTPS:"
echo "  git remote set-url origin https://github.com/mazidcouk/devops-journey.git"
echo ""
echo "If HTTPS fails, try switching to SSH:"
echo "  git remote set-url origin git@github.com:mazidcouk/devops-journey.git"
echo ""
echo "To authenticate with HTTPS, you can use:"
echo "  - Personal Access Token (recommended)"
echo "  - GitHub CLI: gh auth login"
echo "  - Git credential manager"
echo ""
echo "To check if you have uncommitted changes:"
echo "  git status"
echo ""
echo "To check if you're ahead of remote:"
echo "  git log --oneline origin/main..HEAD"
echo ""

# Check if there are commits to push
echo "8. Checking for commits to push..."
echo "-----------------------------------"
if git log --oneline origin/main..HEAD 2>/dev/null | grep -q .; then
    echo "✅ You have commits to push:"
    git log --oneline origin/main..HEAD
else
    echo "ℹ️  No commits to push (you're up to date)"
fi
echo ""

echo "=== Troubleshooting Complete ===" 