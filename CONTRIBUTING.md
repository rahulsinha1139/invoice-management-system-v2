# Contributing to Enterprise Invoice Management System

First off, thank you for considering contributing to our enterprise invoice management system! 🎉

This document provides guidelines and best practices for contributing to this project. By participating in this project, you agree to abide by our code of conduct and maintain the high standards of enterprise-grade development.

## 🚀 Quick Start for Contributors

### Prerequisites
- **Node.js** 18.0+ (LTS recommended)
- **Git** 2.34+
- **npm** 9.0+ or **yarn** 1.22+
- **VS Code** (recommended) with TypeScript extensions

### Development Setup

```bash
# Fork the repository on GitHub
# Clone your fork
git clone https://github.com/your-username/enterprise-invoice-system.git
cd enterprise-invoice-system

# Add upstream remote
git remote add upstream https://github.com/original-owner/enterprise-invoice-system.git

# Install dependencies
npm install

# Start development server
npm run dev

# Verify everything works
npm run build
```

## 🏗️ Development Workflow

### Branch Strategy
We follow **Git Flow** with these branch types:

- `main` - Production-ready code
- `develop` - Integration branch for features
- `feature/*` - New features and enhancements
- `bugfix/*` - Bug fixes
- `hotfix/*` - Critical production fixes
- `release/*` - Release preparation

### Creating a Feature Branch

```bash
# Update your local repository
git checkout main
git pull upstream main

# Create feature branch
git checkout -b feature/customer-bulk-import

# Make your changes...
# Test thoroughly
npm run build
npm test

# Commit with conventional commits
git add .
git commit -m "feat(customers): add bulk import functionality with CSV parsing

- Implement CSV file upload with drag-and-drop
- Add validation for customer data fields
- Create progress indicator for batch operations
- Include error handling for malformed data

Closes #123"
```

## 📝 Commit Message Standards

We use **Conventional Commits** for consistent commit messages:

### Format
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types
- `feat` - New features
- `fix` - Bug fixes
- `docs` - Documentation changes
- `style` - Code style changes (formatting, semicolons, etc.)
- `refactor` - Code refactoring without feature changes
- `perf` - Performance improvements
- `test` - Adding or updating tests
- `chore` - Maintenance tasks, dependency updates
- `ci` - CI/CD configuration changes

### Examples
```bash
feat(invoice): add PDF export functionality
fix(database): resolve connection timeout issues
docs(api): update endpoint documentation with examples
style(components): format code according to prettier rules
refactor(utils): simplify tax calculation logic
perf(database): optimize product queries with indexing
test(api): add comprehensive endpoint testing
chore(deps): update Next.js to version 15.5.3
```

## 🧪 Testing Requirements

### Before Submitting Pull Requests
```bash
# Run all tests
npm test

# Check TypeScript compilation
npm run build

# Verify linting
npm run lint

# Test production build
npm run build && npm start
```

### Testing Guidelines
- Write unit tests for new business logic
- Test API endpoints with various input scenarios
- Verify UI components render correctly
- Test error handling and edge cases
- Ensure cross-browser compatibility
- Validate print functionality

## 📋 Code Standards

### TypeScript Guidelines
```typescript
// ✅ Good - Explicit types and proper naming
interface CustomerCreateRequest {
  name: string;
  billing_address: string;
  city?: string;
  state: string;
  state_code: string;
  gstin?: string;
}

// ✅ Good - Proper error handling
export async function createCustomer(data: CustomerCreateRequest): Promise<Customer> {
  try {
    const result = await db.insertCustomer(data);
    return result;
  } catch (error) {
    throw new Error(`Failed to create customer: ${error.message}`);
  }
}

// ❌ Avoid - Any types and unclear naming
const createStuff = (data: any) => {
  // Implementation
};
```

### Component Guidelines
```tsx
// ✅ Good - Functional component with proper typing
interface InvoiceItemProps {
  item: InvoiceLineItem;
  onUpdate: (item: InvoiceLineItem) => void;
  onRemove: (index: number) => void;
}

export function InvoiceItem({ item, onUpdate, onRemove }: InvoiceItemProps) {
  const handleQuantityChange = (quantity: number) => {
    onUpdate({ ...item, quantity });
  };

  return (
    <tr className="border-b hover:bg-gray-50">
      {/* Component JSX */}
    </tr>
  );
}
```

### API Route Standards
```typescript
// ✅ Good - Proper error handling and validation
export async function POST(request: Request) {
  try {
    const body = await request.json();

    // Validate required fields
    if (!body.name || !body.billing_address) {
      return NextResponse.json(
        { success: false, error: 'Name and billing address are required' },
        { status: 400 }
      );
    }

    const customer = await DatabaseService.createCustomer(body);

    return NextResponse.json({
      success: true,
      data: customer
    });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: error.message },
      { status: 500 }
    );
  }
}
```

## 🎨 UI/UX Guidelines

### Design System
- Follow existing color palette (blue theme: #1e40af, #3b82f6)
- Use consistent spacing with Tailwind CSS utilities
- Maintain professional appearance suitable for business use
- Ensure print optimization for invoice layouts
- Test responsive design on mobile devices

### Accessibility
- Use semantic HTML elements
- Provide proper ARIA labels
- Ensure keyboard navigation support
- Maintain color contrast ratios (WCAG 2.1 AA)
- Test with screen readers

## 🔒 Security Considerations

### Input Validation
- Validate all user inputs on server side
- Sanitize data before database operations
- Use prepared statements for SQL queries
- Implement rate limiting for API endpoints

### Data Protection
- Never log sensitive information
- Use HTTPS in production
- Implement proper error handling without information disclosure
- Follow OWASP security best practices

## 📚 Documentation Requirements

### Code Documentation
- Add JSDoc comments for complex functions
- Document API endpoints with examples
- Update README for new features
- Include inline comments for business logic

### Pull Request Documentation
- Describe the change and motivation
- Include screenshots for UI changes
- List breaking changes if any
- Reference related issues

## 🔄 Pull Request Process

### Before Submitting
1. **Test Thoroughly**
   - Run full test suite
   - Test manually in browser
   - Verify production build works
   - Check API endpoints function correctly

2. **Code Quality**
   - Follow TypeScript strict mode
   - Use consistent formatting (Prettier)
   - Remove console.log statements
   - Update documentation as needed

3. **Review Checklist**
   - [ ] Code follows project standards
   - [ ] Tests pass and coverage maintained
   - [ ] Documentation updated
   - [ ] No breaking changes (or documented)
   - [ ] Performance implications considered
   - [ ] Security implications reviewed

### Pull Request Template
```markdown
## Description
Brief description of changes and motivation.

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## Testing
- [ ] Unit tests pass
- [ ] Manual testing completed
- [ ] Cross-browser testing done
- [ ] API endpoints tested

## Screenshots (if applicable)
Include screenshots for UI changes.

## Additional Notes
Any additional information for reviewers.
```

## 🏷️ Issue Guidelines

### Bug Reports
Use the bug report template and include:
- Clear description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Environment details (browser, OS)
- Screenshots or error messages

### Feature Requests
- Describe the business value
- Include user stories if applicable
- Consider implementation complexity
- Discuss potential alternatives

## 🎯 Areas for Contribution

### High Priority
- Multi-user authentication system
- Advanced invoice templates
- Bulk operations (customers, products)
- Enhanced error handling
- Performance optimizations

### Medium Priority
- API documentation improvements
- Additional export formats (Excel, XML)
- Advanced filtering and search
- Email integration
- Mobile app development

### Documentation
- API endpoint examples
- Deployment guides
- User manuals
- Video tutorials
- Best practices documentation

## 🌟 Recognition

Contributors who make significant improvements will be:
- Listed in the README acknowledgments
- Tagged in release notes
- Invited to join the core contributor team
- Recognized in project presentations

## ❓ Questions?

- **General Questions**: Open a GitHub Discussion
- **Bug Reports**: Create an Issue with bug report template
- **Feature Requests**: Create an Issue with feature request template
- **Security Issues**: Email security@unique-engineers.com
- **Business Inquiries**: Contact unique_engineers2000@yahoo.com

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for helping make this project better! 🚀

*Happy coding!* 💻✨