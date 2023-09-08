args=("$@")
npm i -g @nestjs/cli
for arg in "${args[@]}"; do  :
    nest new ${arg}
done