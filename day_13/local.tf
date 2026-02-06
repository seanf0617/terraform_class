locals  {
    # show ids for all instances
    all_instance_ids = aws_instance.example[*].id
}
