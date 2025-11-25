# API Security Testing Methodology

## Phase 1: Reconnaissance
- Subdomain discovery
- API endpoint enumeration  
- Documentation analysis

## Phase 2: Authentication Testing
- User enumeration testing
- Password policy assessment
- Session management testing

## Phase 3: Authorization Testing
- BOLA (IDOR) testing
- Privilege escalation
- Access control testing

## Phase 4: Input Validation
- SQL injection testing
- XSS testing
- Command injection testing

## Tools & Commands
```bash
# Endpoint discovery
ffuf -u https://TARGET/FUZZ -w wordlists/api_endpoints.txt

# Authentication testing
curl -X POST https://TARGET/auth/login -H "Content-Type: application/json" -d '{}'
