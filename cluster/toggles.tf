variable "enable_larger_instances" {
  type        = bool
  description = "Enable larger instances for AKS cluster"
  default     = false
}

variable "choose_provider" {
  type        = string
  description = "Choose cluster provider, google or azure"
  default     = "google"
}