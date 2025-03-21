# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist" {
  artist = var.artist
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

resource "spotify_playlist" "playlist" {
  name        = "${var.artist} Playlist by Terraform"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    for track in slice(
      data.spotify_search_track.by_artist.tracks,
      0,
      min(var.number_of_tracks, length(data.spotify_search_track.by_artist.tracks))
    ) : track.id
  ]
}
