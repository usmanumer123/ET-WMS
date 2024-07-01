

class Task {
  final dynamic productId;
  final String brand;
  final String description;
  final String purchasedDate;
  final String category;
  final String model;
  final String serialNumber;
  final String cost;
  final String assignedTo;
  final String lastScanDate;
  final String dueDate;
  final String disposedDate;
  final String createdDate;
  final String site;
  final String location;
  final String depreciation;
  final String depreciationMethod;
  final String totalCost;
  final String assetLife;
  final String salvageValue;
  final String dateAquired;
  final String img;

  Task({
    required this.productId,
    required this.brand,
    required this.description,
    required this.purchasedDate,
    required this.category,
    required this.model,
    required this.serialNumber,
    required this.cost,
    required this.assignedTo,
    required this.lastScanDate,
    required this.dueDate,
    required this.disposedDate,
    required this.createdDate,
    required this.site,
    required this.location,
    required this.depreciation,
    required this.depreciationMethod,
    required this.totalCost,
    required this.assetLife,
    required this.salvageValue,
    required this.dateAquired,
    required this.img,
  });

  factory Task.fromMap(Map<String, dynamic> map) => Task(
        productId: map['ProductId'],
        brand: map['Brand'],
        description: map['Description'],
        purchasedDate: map['PurchaseDate'],
        category: map['Category'],
        model: map['Model'],
        serialNumber: map['SerialNumber'],
        cost: map['Cost'],
        assignedTo: map['AssignedTo'],
        lastScanDate: map['id'],
        dueDate: map['DueDate'],
        disposedDate: map['DisposeDate'],
        createdDate: map['CreatedDate'],
        site: map['Site'],
        location: map['Location'],
        depreciation: map['Depreciation'],
        depreciationMethod: map['DepreciationMethod'],
        totalCost: map['TotalCost'],
        assetLife: map['AssetLife'],
        salvageValue: map['SalvageValue'],
        dateAquired: map['DateAquired'],
        img: map['img'],

      );

  Map<String, dynamic> toMap() => {
        "ProductId": productId,
        "Brand": brand,
        "Description": description,
        "PurchaseDate": purchasedDate,
        "Category": category,
        "Model": model,
        "SerialNumber": serialNumber,
        "Cost": cost,
        "AssignedTo": assignedTo,
        "LastScanDate": lastScanDate,
        "DueDate": dueDate,
        "DisposeDate": disposedDate,
        "CreatedDate": createdDate,
        "Site": site,
        "Location": location,
        "Depreciation": depreciation,
        "DepreciationMethod": depreciation,
        "TotalCost": totalCost,
        "AssetLife": assetLife,
        "SalvageValue": salvageValue,
        "DateAquired": dateAquired,
        "img": img
      };
}
