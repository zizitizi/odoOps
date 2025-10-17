
#!/bin/bash
set -e
DEPLOY_DIR=/home/odoo-deploy/deploy
ssh -i ~/.ssh/id_deploy -o StrictHostKeyChecking=no odoo-deploy@${VPS_HOST} << 'EOF'
cd $DEPLOY_DIR
docker-compose pull
docker-compose up -d --remove-orphans
docker image prune -f
EOF
