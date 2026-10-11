resource "grafana_apps_rules_rulesequence_v0alpha1" "apps_rules_rulesequence_v0alpha1s" {
  for_each = var.apps_rules_rulesequence_v0alpha1s


  dynamic "metadata" {
    for_each = each.value.metadata != null ? each.value.metadata : []
    content {
      folder_uid = metadata.value.folder_uid
      uid        = metadata.value.uid
    }
  }

  dynamic "options" {
    for_each = each.value.options != null ? each.value.options : []
    content {
      manager_identity = options.value.manager_identity
      overwrite        = options.value.overwrite
    }
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {
      dynamic "alerting_rules" {
        for_each = spec.value.alerting_rules != null ? spec.value.alerting_rules : []
        content {
          name = alerting_rules.value.name
        }
      }
      dynamic "recording_rules" {
        for_each = spec.value.recording_rules
        content {
          name = recording_rules.value.name
        }
      }
      dynamic "trigger" {
        for_each = spec.value.trigger != null ? spec.value.trigger : []
        content {
          interval = trigger.value.interval
        }
      }
    }
  }
}

