{{- define "mycharts.labels" }}
  labels:
    generator: helm
    deployedby: Siachras-Konstantinos
    data: {{ now | htmlDate }}
{{- end }}
