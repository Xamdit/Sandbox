echo "Quick Menu App"
PS3='Please enter action: '
options=("install" "uninstall" "quit")
select opt in "${options[@]}"; do
    case $opt in
    "install")
        docker network create microservicenetwork
        docker-compose up -d
        break
        ;;
    "uninstall")
        docker-compose down
        docker network rm microservicenetwork
        break
        ;;
    "quit")
        echo "quit"
        break
        ;;
    *)
        echo "invalid option $REPLY"
        break
        ;;
    esac
done
