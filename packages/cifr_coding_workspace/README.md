# Cifr Coding Workspace

A small, presentation- and backend-independent model package for Cifr's coding-agent workspace domain.

## Includes

- Repository workspace metadata and Git context.
- File-tree nodes for coding repositories.
- Coding work items and lifecycle status.
- Structured coding-agent execution timeline events.

## Boundaries

This package belongs to **Cifr UI**. It is not Alhambra's generic workspace package and must not be used as a shared workspace abstraction by Wayang, dashboards, or unrelated applications.

It intentionally has no dependency on Cifr UI widgets, Andalus runtime services, repositories, gRPC clients, or state-management libraries. Applications adapt their domain and transport models at their boundaries.

## Import

```dart
import 'package:cifr_coding_workspace/cifr_coding_workspace.dart';
```
