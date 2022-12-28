#!/usr/bin/env cwl-runner
class: CommandLineTool
cwlVersion: v1.3.0-dev1
requirements:
  LoadListingRequirement:
    loadListing: no_listing
  InlineJavascriptRequirement: {}
inputs:
  d: Directory
outputs:
  out:
    type: boolean
    outputBinding:
      outputEval: $(inputs.d.listing === undefined)
baseCommand: "true"
