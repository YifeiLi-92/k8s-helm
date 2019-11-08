{{/*
Common labels
*/}}
{{- define "dockercoins-test.labels" -}}
projectName: {{ .Values.nameOverride }}
environment: {{ .Values.environment }}
serviceName: {{ .Values.service.name }}
{{- end -}}

{{/*
ports
*/}}
{{- define "dockercoins-test.service.ports" -}}
- port: {{ include "dockercoins-test.service.port" . }}
  targetPort: {{ include "dockercoins-test.service.port" . }}
  protocol: TCP
{{- end -}}

{{/*
port: redis-6379 worker/hasher/rng-80
*/}}
{{- define "dockercoins-test.service.port" -}}
{{- if eq .Values.service.name "redis" -}}
6379
{{- else -}}
{{ .Values.service.port }}
{{- end -}}
{{- end -}}

{{/*
type: webui-NodePort worker/hasher/rng/redis-ClusterIP
*/}}
{{- define "dockercoins-test.service.type" -}}
{{- if eq .Values.service.name "webui" -}}
NodePort
{{- else -}}
ClusterIP
{{- end -}}
{{- end -}}

{{/*
ingress host
*/}}
{{- define "dockercoins-test.ingress.host" -}}
{{- if ne .Values.environment "prod" -}}
{{ .Values.environment }}-
{{- end -}}
{{ .Values.service.name }}.{{ .Values.ingress.host }}
{{- end -}}

{{/*
deployment image
*/}}
{{- define "dockercoins-test.deployment.image" -}}
{{- if eq .Values.service.name "redis" -}}
redis
{{- else -}}
{{ .Values.image.repository }}/{{ .Values.service.name }}:{{ .Values.image.tag }}
{{- end -}}
{{- end -}}