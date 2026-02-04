locals  {
    formatted_project_name = lower(replace(var.project_name, " ", "-"))
    
    new_tag = merge(var.default_tags,var.environment_tags)
    
    formatted_bucket_name = replace(
        replace(
        substr(lower(var.bucket_name),0,63),
        " ", "-")
        ,"!", "")
    
    port_list = split(",", var.allowed_ports)
    
    sg_rules = [ 
        for port in local.port_list :
        {
            name = "port-${port}"
            port = port
            protocol = "tcp"
            description = "allow ingress on port ${port}"
        }
    ]

    instance_size = lookup(var.instance_sizes,var.environment,"t2.mirco")

    all_locations = concat(var.user_locations,var.default_locations)
    unique_locations = toset(local.all_locations)

    positive_cost = [for cost in var.monthly_costs : abs(cost) ]

    current_timestamp = timestamp()
    format1 = formatdate("yyyyMMdd", local.current_timestamp)
    format2 = formatdate("YYYYMMDD", local.current_timestamp)
    timestamp_name = "backup-${local.format1}"

    config_file_exists = fileexists("./config.json")
    config_data = local.config_file_exists ? jsondecode(file("./config.json")) : {}
}
