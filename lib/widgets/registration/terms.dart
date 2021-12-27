import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppm/state/terms/terms_cubit.dart';
import 'package:ppm/theme/theme.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<TermsCubit, bool>(
          builder: (context, termsState) {
            return Checkbox(
                value: termsState,
                onChanged: (bool? value) {
                  termsState == false
                      ? context.read<TermsCubit>().termsCheck()
                      : context.read<TermsCubit>().termsUncheck();
                });
          },
        ),
        Text('Please Accept Terms & Conditions',
            style: theme.textTheme.subtitle2,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr)
      ],
    );
  }
}
