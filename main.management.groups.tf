module "management_groups" {
  source  = "Azure/avm-ptn-alz/azurerm"
  version = "0.21.0"
  count   = var.management_groups_enabled ? 1 : 0

  architecture_name                                                = module.config.outputs.management_group_settings.architecture_name
  parent_resource_id                                               = module.config.outputs.management_group_settings.parent_resource_id
  location                                                         = module.config.outputs.management_group_settings.location
  enable_telemetry                                                 = var.enable_telemetry
  management_group_hierarchy_settings                              = module.config.outputs.management_group_settings.management_group_hierarchy_settings
  retries                                                          = module.config.outputs.management_group_settings.retries
  subscription_placement                                           = local.subscription_placement_filtered
  timeouts                                                         = module.config.outputs.management_group_settings.timeouts
  management_group_role_assignments                                = module.config.outputs.management_group_settings.management_group_role_assignments
  role_assignment_definition_lookup_enabled                        = module.config.outputs.management_group_settings.role_assignment_definition_lookup_enabled
  role_assignment_name_use_random_uuid                             = module.config.outputs.management_group_settings.role_assignment_name_use_random_uuid
  subscription_placement_destroy_behavior                          = module.config.outputs.management_group_settings.subscription_placement_destroy_behavior
  subscription_placement_destroy_custom_target_management_group_id = module.config.outputs.management_group_settings.subscription_placement_destroy_custom_target_management_group_id
  resource_types                                                   = module.config.outputs.management_group_settings.resource_types
  telemetry_additional_content                                     = var.telemetry_additional_content
}

moved {
  from = module.management_groups[0].module.management_groups
  to   = module.management_groups[0]
}
