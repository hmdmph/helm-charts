{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "redis-pod-labeler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "redis-pod-labeler.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "redis-pod-labeler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "redis-pod-labeler.labels" -}}
helm.sh/chart: {{ include "redis-pod-labeler.chart" . }}
{{ include "redis-pod-labeler.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "redis-pod-labeler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "redis-pod-labeler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "redis-pod-labeler.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "redis-pod-labeler.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* master service account for redis labeler */}}
{{- define  "redis-pod-labeler.masterservice" -}}
{{- printf "%s-master-service" .Chart.Name -}}
{{- end -}}

{{/* cluster role for pod labeler */}}
{{- define  "redis-pod-labeler.clusterrole" -}}
{{- printf "%s-role" .Chart.Name -}}
{{- end -}}

{{/* cluster role for pod labeler */}}
{{- define  "redis-pod-labeler.clusterrolebinding" -}}
{{- printf "%s-role-binding" .Chart.Name -}}
{{- end -}}

{{/* role key */}}
{{- define  "redis-pod-labeler.rolekey" -}}
{{- printf "%s/role" .Values.companyDomain -}}
{{- end -}}
