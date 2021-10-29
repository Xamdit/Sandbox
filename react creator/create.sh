args=("$@") 
for arg in "${args[@]}"; do  :
    npx create-react-app ${arg} --template typescript
done