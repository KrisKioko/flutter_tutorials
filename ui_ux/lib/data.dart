import 'dart:convert';

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode(documentJson);

  (String, {DateTime modified}) get metadata {
    if (_json
         case {
          'metadata': {
            'title': String title,
            'modified': String localModified,
          }
         }) {
          return (title, modified: DateTime.parse(localModified));
         } else {
          throw const FormatException('Unexpected JSON');
         }
  }
}

class Block {
  final String type;
  final String text;

  Block(this.type, this.text);
  
  factory Block.fromJson(Map<String, dynamic> json) {
    if (json
         case {
          'type': final type,
          'text': final text,
         }
        ) {
          return Block(type, text);
        } else {
          throw const FormatException('Unexpected JSON format');
        }
  }
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "This is just a formality"
    },
    {
      "type": "checkbox",
      "checked": "true",
      "text": "Learn how to code"
    }
  ]
}
''';