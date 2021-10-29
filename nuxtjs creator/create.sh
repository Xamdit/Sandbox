args=("$@")
for arg in "${args[@]}"; do  :
    npm init nuxt-app ${arg}
done