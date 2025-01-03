#!/usr/bin/env cwl-runner
cwlVersion: v1.3.0-dev1
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
  ScatterFeatureRequirement: {}
  StepInputExpressionRequirement: {}
  SubworkflowFeatureRequirement: {}
inputs:
  i1: int
  i2: int
outputs:
  o1:
    type:
      type: array
      items:
        type: array
        items: int
    outputSource: loop1/o1
steps:
  loop1:
    when: $(inputs.i2 < 4)
    loop:
      i2:
        valueFrom: $(inputs.i2 + 1)
    outputMethod: all_iterations
    run:
      class: Workflow
      inputs:
        i1: int
        i2: int
      outputs:
        o1:
          type: int[]
          outputSource: loop2/o1
      steps:
        loop2:
          when: $(inputs.i1 <= inputs.i2)
          loop:
            i1: o1
          outputMethod: all_iterations
          run:
            class: ExpressionTool
            inputs:
              i1: int
              i2: int
            outputs:
              o1: int
            expression: >
              ${return {'o1': inputs.i1 + 1};}
          in:
            i1: i1
            i2: i2
          out: [o1]
    in:
      i1: i1
      i2: i2
    out: [o1]
