# auxilliary_func.cmake
# A library containing utility functions.

# Function: split_string
# Description:
#   Splits an input string into a list of substrings based on one or more delimiters.
# Parameters:
#   - input_string: The input string to split.
#   - delimiters: A string containing all the delimiters (e.g., ":,;").
#   - output_list: The name of the variable to store the resulting list.
function(split_string input_string delimiters output_list)
    set(local_input_string "${input_string}")
    set(local_output_list "")

    while ("${local_input_string}" MATCHES "[${delimiters}]")
        # Extract the part before the first delimiter
        string(REGEX MATCH "^[^${delimiters}]*" first_part "${local_input_string}")
        list(APPEND local_output_list "${first_part}")
        # Remove the processed part and the delimiter
        string(REGEX REPLACE "^[^${delimiters}]*[${delimiters}]" "" local_input_string "${local_input_string}")
    endwhile()
    # Append the last part
    list(APPEND local_output_list "${local_input_string}")

    # Set the result as an output variable
    set(${output_list} ${local_output_list} PARENT_SCOPE)
endfunction()
