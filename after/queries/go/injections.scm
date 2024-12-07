; extends

(
    [
        (raw_string_literal_content)
        (interpreted_string_literal_content)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE).+(FROM|INTO|VALUES|SET).*(WHERE|GROUP BY)?")
    (#set! injection.language "sql")
)

(
    [
        (raw_string_literal_content)
        (interpreted_string_literal_content)
    ] @injection.content
    (#match? @injection.content "(CREATE|ALTER|DROP|TRUNCATE).+(TABLE)?")
    (#set! injection.language "sql")
)

((call_expression
  function: (selector_expression
    field: (field_identifier) @_method 
    (#any-of? @_method "Printf" "Sprintf" "Fatalf" "Scanf" "Errorf" "Skipf" "Logf"))
  arguments: (argument_list
    (interpreted_string_literal (interpreted_string_literal_content) @injection.content
    (#set! injection.language "printf")))))

((call_expression
  function: (selector_expression
    field: (field_identifier) @_method 
    (#any-of? @_method "Printf" "Sprintf" "Fatalf" "Scanf" "Errorf" "Skipf" "Logf"))
  arguments: (argument_list
    (raw_string_literal (raw_string_literal_content) @injection.content
    (#set! injection.language "printf")))))
