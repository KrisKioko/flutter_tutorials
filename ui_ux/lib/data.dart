import 'dart:convert';

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode(documentJson);

  (String, {DateTime modified}) get metadata {
    if (_json.containsKey('metadata')) {
      final metadataJson = _json['metadata'];
      if (metadataJson is Map) {
        final title = metadataJson['title'] as String;
        final localModified = DateTime.parse(
          metadataJson['modified'] as String,
        );
        return (title, modified: localModified);
      }
    }
    throw const FormatException('Unexpected JSON');
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
      "checked": "false",
      "text": "Learn how to code"
    }
  ]
}
''';