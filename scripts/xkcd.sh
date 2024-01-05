#!/usr/bin/env zsh

# modified from https://www.roboleary.net/2022/02/24/xkcd-in-the-terminal-with-some-bash-magic.html
function xkcd() {
  case "$#" in
    0)
      URL=https://c.xkcd.com/random/comic

      temp_file=$(mktemp)
      curl -s -L $URL > "$temp_file"
      img="https:$(grep 'img src.* title=".*' "$temp_file" | cut -d '"' -f 2)"
          
      # we need to decode HTML entities e.g &quot; to display text correctly
      title="$(grep 'img src.* title=".*' "$temp_file" | cut -d '"' -f 4 | perl -MHTML::Entities -pe 'decode_entities($_);')"

      rm "${temp_file}"

      echo ""
      kitty +kitten icat --align left "$img"
      echo ""
      echo "$title"
      ;;
    1)
      case "$1" in
        -h | --help)
          fmt_help="  %-20s\t%-54s\n"

          echo "Description: Display XKCD comic in the terminal."
          echo ""
          echo "Usage: xkcd [-l|--latest] [-r|--random] [-h|--help]"
          printf "$fmt_help" \
              "-h, --help" "Print the help page." \
              "-l, --latest" "Show the latest comic." \
              "-r, --random" "Show a random comic."	
          ;;
        -l | --latest)
          URL=https://c.xkcd.com/

          temp_file=$(mktemp)
          curl -s -L $URL > "$temp_file"
          img="https:$(grep 'img src.* title=".*' "$temp_file" | cut -d '"' -f 2)"
          
          # we need to decode HTML entities e.g &quot; to display text correctly
          title="$(grep 'img src.* title=".*' "$temp_file" | cut -d '"' -f 4 | perl -MHTML::Entities -pe 'decode_entities($_);')"

          rm "${temp_file}"

          echo ""
          kitty +kitten icat --align left "$img"
          echo ""
          echo "$title"
          ;;
        -r | --random )
          URL=https://c.xkcd.com/random/comic

          temp_file=$(mktemp)
          curl -s -L $URL > "$temp_file"
          img="https:$(grep 'img src.* title=".*' "$temp_file" | cut -d '"' -f 2)"
          
          # we need to decode HTML entities e.g &quot; to display text correctly
          title="$(grep 'img src.* title=".*' "$temp_file" | cut -d '"' -f 4 | perl -MHTML::Entities -pe 'decode_entities($_);')"

          rm "${temp_file}"

          echo ""
          kitty +kitten icat --align left "$img"
          echo ""
          echo "$title"
          ;;
        *)
          echo "Input error."
          ;;
        esac
      ;;
  esac
}
