variable "apps_rules_rulesequence_v0alpha1s" {
  description = <<EOT
Map of apps_rules_rulesequence_v0alpha1s, attributes below
Optional:
    - metadata (block):
        - folder_uid (optional)
        - uid (required)
    - options (block):
        - manager_identity (optional)
        - overwrite (optional)
    - spec (block):
        - alerting_rules (optional, block):
            - name (optional)
        - recording_rules (required, block):
            - name (optional)
        - trigger (optional, block):
            - interval (required)
EOT

  type = map(object({
    metadata = optional(list(object({
      folder_uid = optional(string)
      uid        = string
    })))
    options = optional(list(object({
      manager_identity = optional(string)
      overwrite        = optional(bool)
    })))
    spec = optional(list(object({
      alerting_rules = optional(list(object({
        name = optional(string)
      })))
      recording_rules = list(object({
        name = optional(string)
      }))
      trigger = optional(list(object({
        interval = string
      })))
    })))
  }))
}

