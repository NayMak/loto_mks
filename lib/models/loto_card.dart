class LotoCard {
  String id;
  String asset;

  LotoCard({required this.id, required this.asset});

  @override
  String toString() {
    return 'this.id: $id, this.asset: $asset';
  }
}
