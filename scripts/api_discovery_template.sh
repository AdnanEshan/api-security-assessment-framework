#!/bin/bash
# API Discovery Template Script
# REPLACE ALL PLACEHOLDERS WITH AUTHORIZED TARGETS

echo "API Discovery Template Script"
echo "============================="
echo "WARNING: Replace placeholders with authorized targets before use!"
echo ""

# CONFIGURATION - REPLACE THESE WITH YOUR AUTHORIZED TARGETS
TARGET_DOMAIN="example.com"                    # REPLACE
API_BASE_URL="https://api.example.com"         # REPLACE  
PARTNER_PORTAL="https://partner.example.com"   # REPLACE

# Output directory for results (keep local, don't commit to git)
OUTPUT_DIR="./scan_results"
mkdir -p $OUTPUT_DIR

echo "[+] Starting API discovery for: $TARGET_DOMAIN"
echo ""

# 1. SUBDOMAIN DISCOVERY (EXAMPLE STRUCTURE)
echo "[1] Subdomain Discovery"
echo "-----------------------"
echo "# subfinder -d $TARGET_DOMAIN -o $OUTPUT_DIR/subdomains.txt"
echo "# amass enum -d $TARGET_DOMAIN -o $OUTPUT_DIR/amass_results.txt"
echo ""

# 2. API ENDPOINT DISCOVERY (EXAMPLE STRUCTURE)  
echo "[2] API Endpoint Discovery"
echo "--------------------------"
echo "# ffuf -u \"$API_BASE_URL/FUZZ\" \\"
echo "#   -w ./wordlists/api_endpoints.txt \\"
echo "#   -mc 200,201,301,302,401,403 \\"
echo "#   -o $OUTPUT_DIR/ffuf_scan.json"
echo ""

# 3. COMMON API PATTERNS TEST (EXAMPLE STRUCTURE)
echo "[3] Testing Common API Patterns"
echo "-------------------------------"
apis=("api" "api/v1" "api/v2" "graphql" "rest" "v1" "v2" "v3")
for api in "${apis[@]}"; do
    echo "# Testing: $API_BASE_URL/$api"
    echo "# curl -s \"$API_BASE_URL/$api\" -I | head -1"
done
echo ""

# 4. DOCUMENTATION ENDPOINTS (EXAMPLE STRUCTURE)
echo "[4] API Documentation Discovery"
echo "-------------------------------"
docs=("api-docs" "swagger" "swagger-ui" "redoc" "openapi" "docs")
for doc in "${docs[@]}"; do
    echo "# Testing: $API_BASE_URL/$doc"
    echo "# curl -s \"$API_BASE_URL/$doc\" -I | head -1"
done
echo ""

# 5. AUTHENTICATION ENDPOINTS (EXAMPLE STRUCTURE)
echo "[5] Authentication Endpoint Discovery"
echo "-------------------------------------"
auth_endpoints=("auth" "login" "oauth" "token" "register" "signin")
for auth in "${auth_endpoints[@]}"; do
    echo "# Testing: $API_BASE_URL/$auth"
    echo "# curl -s \"$API_BASE_URL/$auth\" -I | head -1"
done
echo ""

# 6. PARTNER PORTAL SPECIFIC (EXAMPLE STRUCTURE)
echo "[6] Partner Portal API Discovery"
echo "--------------------------------"
echo "# Testing partner portal endpoints"
partner_endpoints=("api" "api/v1" "graphql" "rest" "v1")
for endpoint in "${partner_endpoints[@]}"; do
    echo "# Testing: $PARTNER_PORTAL/$endpoint"
    echo "# curl -s \"$PARTNER_PORTAL/$endpoint\" -I | head -1"
done
echo ""

# 7. SECURITY HEADERS CHECK (EXAMPLE STRUCTURE)
echo "[7] Security Headers Check"
echo "--------------------------"
echo "# curl -I $API_BASE_URL/api/v1/ | grep -E \"(X-|Content-Security|Strict-Transport)\""
echo ""

# 8. GRAPHQL TESTING (EXAMPLE STRUCTURE)
echo "[8] GraphQL Endpoint Testing"
echo "----------------------------"
echo "# Testing GraphQL endpoints"
echo "# curl -X POST \"$API_BASE_URL/graphql\" \\"
echo "#   -H \"Content-Type: application/json\" \\"
echo "#   -d '{\"query\":\"{__schema{types{name}}}\"}'"
echo ""

# 9. BACKEND SERVICES (EXAMPLE STRUCTURE)
echo "[9] Backend Service Discovery"
echo "-----------------------------"
backend_services=("backend" "api-backend" "service" "microservice")
for service in "${backend_services[@]}"; do
    echo "# Testing: https://$service.$TARGET_DOMAIN/"
    echo "# curl -s \"https://$service.$TARGET_DOMAIN/\" -I | head -1"
done
echo ""

echo "=========================================="
echo "SCRIPT EXECUTION COMPLETE"
echo "=========================================="
echo ""
echo "NEXT STEPS:"
echo "1. Replace all placeholder domains with authorized targets"
echo "2. Uncomment the commands you want to execute"
echo "3. Run the script against authorized systems only"
echo "4. Keep scan results local and confidential"
echo "5. Never commit actual results to version control"
echo ""
echo "Output directory: $OUTPUT_DIR"
echo "Remember: Always get proper authorization before scanning!"
