class Module {
  const Module({
    this.id,
    this.encryptionId,
    this.description,
    this.object,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? encryptionId;
  final String? description;
  final String? object;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
