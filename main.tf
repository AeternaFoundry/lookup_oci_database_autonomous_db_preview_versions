data "oci_database_autonomous_db_preview_versions" "database_autonomous_db_preview_versions_lookup" {
  for_each = var.database_autonomous_db_preview_versions_lookup

  compartment_id = each.value.compartment_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

