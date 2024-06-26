import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String _dropDownValue = '1 Hour';

  final List<String> _items = [
    '1 Hour',
    '2 Hour',
    '3 Hour',
    '4 Hour',
    '5 Hour'
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromARGB(71, 0, 0, 0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: DropdownButton<String>(
            dropdownColor: Color.fromARGB(162, 0, 0, 0),
            items: _items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _dropDownValue = newValue!;
              });
            },
            value: _dropDownValue,
            underline: SizedBox(), // to remove the underline
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

// QUESTION ANSWERS DROPDOWN

class QAList extends StatelessWidget {
  final List<Map<String, String>> questionsAndAnswers = [
    {
      "question": "What is your thought about the product?",
      "answer": "The product is exceptional.",
    },
    {
      "question": "What is your thought about the product?",
      "answer": "The product is exceptional.",
    },
    {
      "question": "What is your thought about the product?",
      "answer": "The product is exceptional.",
    },
    {
      "question": "What is your thought about the product?",
      "answer": "The product is exceptional.",
    },
    {
      "question": "What is your thought about the product?",
      "answer": "The product is exceptional.",
    },
    {
      "question": "What is your thought about the product?",
      "answer": "The product is exceptional.",
    },
    
    
    // Add more questions and answers here
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (int i = 0; i < questionsAndAnswers.length; i++) {
      widgets.add(QACard(
        question: questionsAndAnswers[i]['question']!,
        answer: questionsAndAnswers[i]['answer']!,
      ));

      if (i == 1) {
        widgets.add(SizedBox(height: 10));
        widgets.add(Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Other questions',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 104, 60, 149),
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
      }
    }

    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: widgets,
    );
  }
}

class QACard extends StatelessWidget {
  final String question;
  final String answer;

  QACard({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: ExpansionTile(
            title: Text(
              question,
              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(answer,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.black)),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}