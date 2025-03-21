# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "spotify_api_key" {
  type        = string
  description = "Set this as the APIKey that the authorization proxy server outputs"
}

variable "artist" {
  type        = string
  description = "The artist to build a playlist for."
}

variable "number_of_tracks" {
  type        = number
  description = "Number of tracks to include in the playlist. Maximum without pagination is 10."
  default     = 3
}