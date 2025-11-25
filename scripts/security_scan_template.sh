#!/bin/bash
# Comprehensive API Security Scan Template
# REPLACE ALL PLACEHOLDERS WITH AUTHORIZED TARGETS

echo "=================================================="
echo "    API SECURITY SCAN TEMPLATE"
echo "=================================================="
echo "⚠️  WARNING: This is a template script."
echo "⚠️  Replace all placeholders before use."
echo "⚠️  Use only on authorized systems."
echo "=================================================="
echo ""

# CONFIGURATION - REPLACE WITH AUTHORIZED TARGETS
TARGET_DOMAIN="example.com"                          # REPLACE
API_BASE="https://api.example.com"                   # REPLACE  
PARTNER_PORTAL="https://partner.example.com"         # REPLACE
BACKEND_API="https://backend-api.example.com"        # REPLACE

# Output directories (keep local, never commit to git)
SCAN_DIR="./security_scan_results"
LOGS_DIR="$SCAN_DIR/logs"
ENUM_DIR="$SCAN_DIR/enumeration"
AUTH_DIR="$SCAN_DIR/authentication"

mkdir -p $SCAN_DIR $LOGS_DIR $ENUM_DIR $AUTH_DIR

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGS_DIR/scan.log"
}

# Safety check
safety_check() {
    log "Performing safety checks..."
    if [[ "$TARGET_DOMAIN" == *"example.com"* ]]; then
        log "❌ ERROR: Template domains detected. Replace with authorized targets."
        exit 1
    fi
    log "✅ Safety checks passed"
}

# Phase 1: Reconnaissance
phase1_recon() {
    log "Starting Phase 1: Reconnaissance"
    echo ""
    echo "1. SUBDOMAIN DISCOVERY"
    echo "======================"
    
    echo "# Passive subdomain discovery:"
    echo "# subfinder -d $TARGET_DOMAIN -silent | tee $ENUM_DIR/subdomains.txt"
    echo "# amass enum -passive -d $TARGET_DOMAIN -o $ENUM_DIR/amass.txt"
    echo ""
    
    echo "# DNS enumeration:"
    echo "# dig $TARGET_DOMAIN ANY +noall +answer"
    echo "# host $TARGET_DOMAIN"
    echo ""
    
    log "Phase 1 reconnaissance commands generated"
}

# Phase 2: API Endpoint Discovery
phase2_endpoint_discovery() {
    log "Starting Phase 2: API Endpoint Discovery"
    echo ""
    echo "2. API ENDPOINT DISCOVERY"
    echo "========================"
    
    echo "# General endpoint discovery:"
    echo "# ffuf -u \"$API_BASE/FUZZ\" \\"
    echo "#   -w ./wordlists/api_endpoints.txt \\"
    echo "#   -mc 200,201,301,302,401,403 \\"
    echo "#   -o $ENUM_DIR/ffuf_api.json"
    echo ""
    
    echo "# Partner portal endpoints:"
    echo "# ffuf -u \"$PARTNER_PORTAL/FUZZ\" \\"
    echo "#   -w ./wordlists/common_apis.txt \\"
    echo "#   -mc 200,301,302,403 \\"
    echo "#   -o $ENUM_DIR/ffuf_partner.json"
    echo ""
    
    echo "# Manual endpoint testing:"
    endpoints=("api" "api/v1" "api/v2" "graphql" "rest" "v1" "v2")
    for endpoint in "${endpoints[@]}"; do
        echo "# curl -s \"$API_BASE/$endpoint\" -I | head -1"
    done
    echo ""
    
    log "Phase 2 endpoint discovery commands generated"
}

# Phase 3: Authentication Testing
phase3_auth_testing() {
    log "Starting Phase 3: Authentication Testing"
    echo ""
    echo "3. AUTHENTICATION SECURITY TESTING"
    echo "================================="
    
    echo "# Login endpoint discovery:"
    echo "# curl -s \"$API_BASE/auth\" -I"
    echo "# curl -s \"$API_BASE/login\" -I"
    echo "# curl -s \"$API_BASE/api/v1/auth\" -I"
    echo ""
    
    echo "# User enumeration testing:"
    echo "# python3 auth_testing_template.py"
    echo "# (Replace placeholders in template first)"
    echo ""
    
    echo "# SQL injection testing:"
    echo "# sqlmap -u \"$API_BASE/api/v1/auth/login\" --data='email=test&password=test' --risk=3 --level=5"
    echo ""
    
    echo "# Rate limiting testing:"
    echo "for i in {1..20}; do"
    echo "  curl -X POST \"$API_BASE/api/v1/auth/login\" \\"
    echo "    -H \"Content-Type: application/json\" \\"
    echo "    -d '{\"email\":\"test\",\"password\":\"test\"}' &"
    echo "done"
    echo "wait"
    echo ""
    
    log "Phase 3 authentication testing commands generated"
}

# Phase 4: Authorization Testing
phase4_authz_testing() {
    log "Starting Phase 4: Authorization Testing"
    echo ""
    echo "4. AUTHORIZATION TESTING"
    echo "========================"
    
    echo "# BOLA (IDOR) testing template:"
    echo "# Test endpoints with numeric IDs:"
    echo "# curl -s \"$API_BASE/api/v1/users/1\" -H \"Authorization: Bearer TOKEN\""
    echo "# curl -s \"$API_BASE/api/v1/users/2\" -H \"Authorization: Bearer TOKEN\""
    echo "# curl -s \"$API_BASE/api/v1/orders/1001\" -H \"Authorization: Bearer TOKEN\""
    echo "# curl -s \"$API_BASE/api/v1/orders/1002\" -H \"Authorization: Bearer TOKEN\""
    echo ""
    
    echo "# Privilege escalation testing:"
    echo "# Test different user roles accessing admin endpoints"
    echo "# curl -s \"$API_BASE/api/v1/admin/users\" -H \"Authorization: Bearer USER_TOKEN\""
    echo "# curl -s \"$API_BASE/api/v1/admin/settings\" -H \"Authorization: Bearer USER_TOKEN\""
    echo ""
    
    log "Phase 4 authorization testing commands generated"
}

# Phase 5: Input Validation Testing
phase5_input_testing() {
    log "Starting Phase 5: Input Validation Testing"
    echo ""
    echo "5. INPUT VALIDATION TESTING"
    echo "==========================="
    
    echo "# SQL injection in various parameters:"
    echo "# curl -X GET \"$API_BASE/api/v1/users?search=test' OR '1'='1\""
    echo "# curl -X GET \"$API_BASE/api/v1/orders?user_id=1' UNION SELECT 1,2,3--\""
    echo ""
    
    echo "# NoSQL injection testing:"
    echo "# curl -X POST \"$API_BASE/api/v1/search\" \\"
    echo "#   -H \"Content-Type: application/json\" \\"
    echo "#   -d '{\"username\":{\"\$ne\":\"\"},\"password\":{\"\$ne\":\"\"}}'"
    echo ""
    
    echo "# XSS testing in input fields:"
    echo "# curl -X POST \"$API_BASE/api/v1/contact\" \\"
    echo "#   -H \"Content-Type: application/json\" \\"
    echo "#   -d '{\"name\":\"<script>alert(1)</script>\",\"email\":\"test@test.com\"}'"
    echo ""
    
    echo "# Command injection testing:"
    echo "# curl -X GET \"$API_BASE/api/v1/export?format=pdf;id\""
    echo "# curl -X GET \"$API_BASE/api/v1/debug?command=ls+-la\""
    echo ""
    
    log "Phase 5 input validation testing commands generated"
}

# Phase 6: Security Headers & Configuration
phase6_security_headers() {
    log "Starting Phase 6: Security Headers & Configuration"
    echo ""
    echo "6. SECURITY HEADERS & CONFIGURATION"
    echo "==================================="
    
    echo "# Security headers check:"
    echo "# curl -I \"$API_BASE/api/v1/\" | grep -E \"(X-|Content-Security|Strict-Transport)\""
    echo "# curl -I \"$PARTNER_PORTAL/\" | grep -E \"(X-|Content-Security|Strict-Transport)\""
    echo ""
    
    echo "# CORS configuration testing:"
    echo "# curl -H \"Origin: https://evil.com\" -I \"$API_BASE/api/v1/users\""
    echo "# curl -H \"Origin: null\" -I \"$API_BASE/api/v1/users\""
    echo ""
    
    echo "# HTTP methods testing:"
    echo "# curl -X OPTIONS \"$API_BASE/api/v1/users\" -I"
    echo "# curl -X TRACE \"$API_BASE/api/v1/users\" -I"
    echo "# curl -X TRACK \"$API_BASE/api/v1/users\" -I"
    echo ""
    
    echo "# TLS/SSL configuration:"
    echo "# sslscan $TARGET_DOMAIN"
    echo "# testssl.sh $TARGET_DOMAIN"
    echo ""
    
    log "Phase 6 security headers testing commands generated"
}

# Phase 7: Business Logic Testing
phase7_business_logic() {
    log "Starting Phase 7: Business Logic Testing"
    echo ""
    echo "7. BUSINESS LOGIC TESTING"
    echo "========================"
    
    echo "# Payment amount manipulation:"
    echo "# curl -X POST \"$API_BASE/api/v1/payments\" \\"
    echo "#   -H \"Content-Type: application/json\" \\"
    echo "#   -H \"Authorization: Bearer TOKEN\" \\"
    echo "#   -d '{\"amount\":-100.00,\"currency\":\"USD\"}'"
    echo ""
    
    echo "# Race condition testing:"
    echo "for i in {1..10}; do"
    echo "  curl -X POST \"$API_BASE/api/v1/orders\" \\"
    echo "#     -H \"Authorization: Bearer TOKEN\" \\"
    echo "#     -d '{\"product_id\":1,\"quantity\":1}' &"
    echo "done"
    echo "wait"
    echo ""
    
    echo "# Workflow bypass testing:"
    echo "# Try to skip steps in multi-step processes"
    echo "# curl -X POST \"$API_BASE/api/v1/checkout/step3\" \\"
    echo "#   -H \"Authorization: Bearer TOKEN\" \\"
    echo "#   -d '{\"payment_method\":\"card\"}'"
    echo ""
    
    log "Phase 7 business logic testing commands generated"
}

# Main execution function
main() {
    echo "Starting Comprehensive API Security Scan"
    echo "Target: $TARGET_DOMAIN"
    echo "Scan Directory: $SCAN_DIR"
    echo ""
    
    # Safety first
    safety_check
    
    # Execute all phases
    phase1_recon
    phase2_endpoint_discovery
    phase3_auth_testing
    phase4_authz_testing
    phase5_input_testing
    phase6_security_headers
    phase7_business_logic
    
    echo ""
    echo "=================================================="
    echo "              SCAN TEMPLATE COMPLETE"
    echo "=================================================="
    echo ""
    echo "📋 NEXT STEPS:"
    echo "1. Replace all placeholder domains with authorized targets"
    echo "2. Uncomment and modify commands as needed"
    echo "3. Obtain proper authorization before scanning"
    echo "4. Use test environments, not production"
    echo "5. Keep all results confidential"
    echo "6. Never commit actual findings to version control"
    echo ""
    echo "📁 Output structure created at: $SCAN_DIR"
    echo "📝 Log file: $LOGS_DIR/scan.log"
    echo ""
    log "Security scan template generation completed"
}

# Run main function
main
