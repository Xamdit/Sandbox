args=("$@")
# npx express-generator
# npm install -g express-generator
# npm install -g typescript-express-starter
for arg in "${args[@]}"; do
    :
    npx typescript-express-starter ${arg}
done
