import '../../widget-x/all_widgets.dart';
import 'mbx_faq_controller.dart';
import 'mbx_faq_item.dart';

class MbxFaqScreen extends StatelessWidget {
  const MbxFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxFaqController>(
      init: MbxFaqController(),
      builder: (controller) => MbxScreen(
        title: 'faq'.tr,
        curvedBody: ContainerX(
          backgroundColor: ColorX.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search field
                Container(
                  decoration: BoxDecoration(
                    color: ColorX.gray.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      hintText: 'search_faq'.tr,
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    onChanged: (value) {
                      controller.searchFaq(value);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // FAQ List
                Expanded(
                  child: controller.filteredFaqList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 64,
                                color: ColorX.gray,
                              ),
                              const SizedBox(height: 16),
                              TextX('no_faq_found'.tr, color: ColorX.gray),
                            ],
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: ClampingScrollPhysics(),
                          itemCount: controller.filteredFaqList.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            return MbxFaqItem(
                              faq: controller.filteredFaqList[index],
                              onTap: () {
                                controller.toggleExpanded(index);
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
