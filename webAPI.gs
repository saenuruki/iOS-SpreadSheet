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

function doPost(e) {
  var params = JSON.parse(e.postData.getDataAsString());
  var spreadsheetId = '1E6*******************************lgY';
  var spreadsheet = SpreadsheetApp.openById(spreadsheetId);
  var sheet = spreadsheet.getSheetByName('resultExam');

  // 行の最後に値を追加
  sheet.appendRow([params.deviceID, params.createdAt, params.examID1, params.examType1, params.result1]);
  sheet.appendRow([params.deviceID, params.createdAt, params.examID2, params.examType2, params.result2]);
  sheet.appendRow([params.deviceID, params.createdAt, params.examID3, params.examType3, params.result3]);
  
  var output = ContentService.createTextOutput();
  output.setMimeType(ContentService.MimeType.JSON);
  output.setContent(JSON.stringify({ message: 'success!' }));

  return output;
}
