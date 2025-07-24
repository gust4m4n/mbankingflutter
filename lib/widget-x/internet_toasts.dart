import 'all_widgets.dart';

class InternetOfflineToast extends StatelessWidget {
  const InternetOfflineToast({super.key});
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: ColorX.red,
      padding:
          const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Wrap(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Expanded(
              child: TextX(
                'No internet connection',
                color: ColorX.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
                maxLines: 16,
              ),
            ),
            const SizedBox(width: 8.0),
            ButtonX(
              title: 'OK',
              backgroundColor: ColorX.transparent,
              borderWidth: 1.0,
              borderColor: ColorX.white,
              width: 50.0,
              height: 32.0,
              clicked: () async {
                await ToastX.dismissCustom();
              },
            )
          ]),
        ],
      ),
    );
  }
}

class InternetOnlineToast extends StatelessWidget {
  const InternetOnlineToast({super.key});
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: ColorX.green,
      padding:
          const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Wrap(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Expanded(
              child: TextX(
                'Back to online',
                color: ColorX.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
                maxLines: 16,
              ),
            ),
            const SizedBox(width: 8.0),
            ButtonX(
              title: 'OK',
              backgroundColor: ColorX.transparent,
              borderWidth: 1.0,
              borderColor: ColorX.white,
              width: 50.0,
              height: 32.0,
              clicked: () async {
                await ToastX.dismissCustom();
              },
            )
          ]),
        ],
      ),
    );
  }
}
