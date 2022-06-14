case $1 in

  jtx | ffm)
    
    nixos-rebuild switch --flake '.#'$1 --use-remote-sudo
    ;;

  *)

    echo "ERROR: debe especificar un sistema para instalar jtx | ffm"
    ;;

esac
