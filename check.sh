# !/bin/sh
# RED=`tput setaf 1;`;
# GREEN=`tput setaf 2`;
# NOCOLOR=`tput sgr0`;

# file_list=$(git diff --name-only --staged);
# for file in $file_list; do
#     is_sass=$(echo $file | grep .scss);
#     if [[ ! -z $is_sass ]]; then
#         lint_output=$(scss-lint ${file} | grep "");
#         if [[ ! -z $lint_output ]]; then
#             echo "${file}: ${RED}needs ${RED}formatting!${NOCOLOR}";
#             exit 1;
#         else
#             echo "${file}: ${GREEN}PASSED!${NOCOLOR}";
#         fi
#     fi
# done
# exit 0;

