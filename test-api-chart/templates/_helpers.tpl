{{/* Generate common labels */}}
{{- define "common.labels" -}}
app: {{ include "chart.fullname" . }}
release: {{ .Release.Name }}
{{- end -}}

{{/* Generate chart name */}}
{{- define "chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Generate full name */}}
{{- define "chart.fullname" -}}
{{- if .Values.nameOverride -}}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name -}}
{{- end -}}
{{- end -}}