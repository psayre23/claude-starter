# Development Principles

This document outlines the core software development principles and best practices that should guide all code written for this project.

## Core Principles

### DRY (Don't Repeat Yourself)
- Avoid code duplication by extracting common logic into reusable functions, classes, or modules
- If you write the same code pattern more than twice, consider abstracting it
- Balance DRY with readability - premature abstraction can be worse than slight duplication

### YAGNI (You Aren't Gonna Need It)
- Don't add functionality until it's actually needed
- Avoid building features "just in case" or for hypothetical future requirements
- Focus on solving the current problem well rather than over-engineering for unknown futures

### KISS (Keep It Simple, Stupid)
- Prefer simple, straightforward solutions over complex ones
- Simple code is easier to read, test, maintain, and debug
- Complexity should only be introduced when clearly justified by requirements

### Single Responsibility Principle
- Each function, class, or module should have one clear purpose
- If you struggle to name something concisely, it may be doing too much
- Changes to requirements should ideally affect only one module

## Testing Philosophy

### Test-Driven Development (TDD)
- Write tests before implementation when it helps clarify requirements
- Tests serve as living documentation of expected behavior
- Aim for high test coverage, but focus on meaningful tests over metrics

### Test Quality
- Tests should be independent and able to run in any order
- Each test should verify one specific behavior
- Use descriptive test names that explain what's being tested and why
- Prefer integration tests that verify real behavior over mocking everything

### Test-Driven Completion
- **Tests must pass before task completion**: A task is not considered complete until all tests pass
- Never commit or mark work as done with failing tests
- If tests fail, either fix the code or fix the tests - never skip or ignore failures
- Maintain the >85% coverage requirement throughout development

## Code Quality

### Readability First
- Code is read far more often than it's written
- Use clear, descriptive names for variables, functions, and classes
- Prefer explicit over clever code
- Add comments to explain "why", not "what" (the code shows what)

### Error Handling
- Fail fast and fail clearly with meaningful error messages
- Handle expected errors explicitly
- Let unexpected errors bubble up rather than silently swallowing them
- Validate inputs at system boundaries (user input, external APIs)

### Type Safety
- Use TypeScript's type system to catch errors at compile time
- Avoid `any` types unless absolutely necessary
- Leverage union types, type guards, and discriminated unions
- Use strict TypeScript configuration

## Frontend Development

### Progressive Enhancement
- Build core functionality that works without JavaScript first
- Enhance with JavaScript for better user experience
- Ensure critical features degrade gracefully when JS fails or is disabled
- Consider users on slow networks or older devices

### Responsive Design
- Design for mobile first, then enhance for larger screens
- Use relative units (rem, em, %) over absolute pixels
- Test on multiple screen sizes and devices
- Consider touch interfaces and accessibility from the start

### Performance
- Minimize bundle sizes through code splitting and tree shaking
- Lazy load non-critical resources
- Optimize images and assets
- Measure performance with real user metrics, not just synthetic tests

## Backend Development

### API Design
- Design APIs that are intuitive and consistent
- Use appropriate HTTP methods and status codes
- Version APIs to allow non-breaking evolution
- Document API contracts clearly (OpenAPI/Swagger)

### Database Practices
- Use transactions for operations that must succeed or fail together
- Index columns used in WHERE clauses and joins
- Avoid N+1 queries through proper eager loading
- Use connection pooling efficiently

### Security
- Validate and sanitize all user input
- Use parameterized queries to prevent SQL injection
- Implement proper authentication and authorization
- Follow principle of least privilege for database and API access
- Keep dependencies updated to patch security vulnerabilities

## Development Workflow

### Version Control
- Make small, focused commits with clear messages
- Commit working code frequently
- Use feature branches for new development
- Review code before merging to main branches

### Code Review
- Review for correctness, readability, and maintainability
- Check that tests adequately cover new functionality
- Ensure consistent style with existing codebase
- Be constructive and respectful in feedback

### Continuous Integration
- Run tests automatically on every commit
- Fail builds on linting errors or test failures
- Keep builds fast to encourage frequent commits
- Deploy automatically from main branch when tests pass

## Docker-First Development

### Containerization Strategy
- All development happens inside Docker containers
- No global tool installations required on host machine
- The development environment is fully portable and reproducible
- Use `make` commands for common operations
- Use `docker exec` or `make shell` for interactive commands inside containers

### Container Development Workflow
- Start all services: `make up`
- Stop all services: `make down`
- View logs: `make logs`
- Rebuild and restart: `make dev`
- Run commands in container: `docker exec -it <container-name> <command>`
- Hot-reload enabled via volume mounts for rapid iteration
- Database and services accessible from host for GUI tools and debugging

### Running Commands in Containers
**Always run in containers:**
- Package management: `docker exec -it stash-api npm install`
- Running tests: `docker exec -it stash-api npm test`
- Building the project: `docker exec -it stash-api npm run build`
- Running migrations: `docker exec -it stash-api npm run migrate`
- CLI tools: Use `npx` inside container instead of global installations

**Optional on host:**
- IDE/editor (supports remote container development)
- Git operations (commit, push, pull)
- Viewing logs via `make logs`
- File editing (changes sync to container via volumes)

### Benefits of Docker-First Approach
- Consistent environment across all developers
- No "works on my machine" issues
- Easy onboarding - just clone and `make up`
- Isolates project dependencies from host system
- Matches production environment closely
- Simple cleanup - remove containers, not system packages

## Documentation

### Code Documentation
- Document public APIs and complex algorithms
- Keep documentation close to the code it describes
- Update documentation when changing code
- Use JSDoc/TSDoc for function documentation

### Project Documentation
- Maintain up-to-date README with setup instructions
- Document architecture decisions and their rationale
- Keep runbooks for common operations and troubleshooting
- Document environment-specific configuration

## When to Break These Rules

These principles are guidelines, not absolute laws. Break them when:
- Following the rule would make the code significantly worse
- The specific context calls for a different approach
- You can clearly articulate why the exception is justified
- The trade-offs are understood and accepted

Good judgment sometimes means knowing when to be pragmatic over dogmatic.
