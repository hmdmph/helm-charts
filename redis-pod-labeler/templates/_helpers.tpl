{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "redis-pod-labeler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "redis-pod-labeler.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "redis-pod-labeler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* master service account for redis labeler */}}
{{- define  "redis-pod-labeler.masterservice" -}}
{{- printf "%s-master-service" .Chart.Name -}}
{{- end -}}

{{/* service account for pod labeler */}}
{{- define  "redis-pod-labeler.serviceaccount" -}}
{{- printf "%s-service-account" .Chart.Name -}}
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
