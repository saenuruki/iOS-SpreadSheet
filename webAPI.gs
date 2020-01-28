function getVitalDatas() {
  var spreadsheetId = '1E6*******************************lgY';
  var rangeName = 'sensorList!D3:H10';
  var values = Sheets.Spreadsheets.Values.get(spreadsheetId, rangeName).values;
  if (!values) {
    return {'error': 'No data found.'}
  } else {
    var resultArray = [];
    for (var row = 0; row < values.length; row++) {
      var jsonRecord = {
        'id': values[row][0],
        'name': values[row][1],
        'nameJP': values[row][2],
        'description': values[row][3],
        'usage': values[row][4]
      }
      resultArray.push(jsonRecord);
    }
    return resultArray;
  }
}

function doGet(e){
    var result = JSON.stringify({'vitals': getVitalDatas()});
    return ContentService.createTextOutput(result).setMimeType(ContentService.MimeType.JSON);
}
