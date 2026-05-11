import 'package:flutter/material.dart';

import '../../core/drip_colors.dart';

class DripProductListItem extends StatelessWidget {
  final String productName;
  final String price;
  final String unit;
  final VoidCallback onAdd;
  final String? imageUrl;
  final Widget? image;
  final String? label;
  final String? store;
  final bool showLabel;
  final bool showStore;
  final bool showAddButton;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  const DripProductListItem({
    super.key,
    required this.productName,
    required this.price,
    required this.unit,
    required this.onAdd,
    this.imageUrl,
    this.image,
    this.label,
    this.store,
    this.showLabel = true,
    this.showStore = true,
    this.showAddButton = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: DripColors.cardBg,
        borderRadius: borderRadius,
        border: Border.all(color: DripColors.greyText.withOpacity(0.16)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ProductImage(imageUrl: imageUrl, image: image),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showLabel && label != null && label!.trim().isNotEmpty) ...[
                  _Tag(text: label!),
                  const SizedBox(height: 8),
                ],
                Text(
                  productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                if (showStore && store != null && store!.trim().isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    store!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      color: DripColors.greyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            price,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '/ $unit',
                            style: textTheme.bodySmall?.copyWith(
                              color: DripColors.greyText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (showAddButton) ...[
                      const SizedBox(width: 12),
                      _AddButton(onPressed: onAdd),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DripProductSquareCard extends StatelessWidget {
  final String productName;
  final String price;
  final String unit;
  final VoidCallback onAdd;
  final String? imageUrl;
  final Widget? image;
  final String? label;
  final String? store;
  final bool showLabel;
  final bool showStore;
  final bool showAddButton;
  final BorderRadius borderRadius;
  final double imageAspectRatio;

  const DripProductSquareCard({
    super.key,
    required this.productName,
    required this.price,
    required this.unit,
    required this.onAdd,
    this.imageUrl,
    this.image,
    this.label,
    this.store,
    this.showLabel = true,
    this.showStore = true,
    this.showAddButton = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
    this.imageAspectRatio = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardSize = constraints.maxWidth;
          final dense = cardSize < 170;
          final compact = cardSize < 220;

          final horizontalPadding = cardSize * 0.06;
          final verticalPadding = cardSize * 0.05;
          final innerSpacing = cardSize * 0.035;
          final labelSpacing = cardSize * 0.025;
          final buttonSize = dense ? cardSize * 0.14 : cardSize * 0.16;

          final titleStyle = (compact ? textTheme.titleSmall : textTheme.titleMedium)?.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.black87,
            fontSize: compact ? cardSize * 0.072 : cardSize * 0.078,
          );
          final storeStyle = textTheme.bodySmall?.copyWith(
            color: DripColors.greyText,
            fontWeight: FontWeight.w500,
            fontSize: dense ? cardSize * 0.043 : cardSize * 0.045,
          );
          final priceStyle = (compact ? textTheme.titleSmall : textTheme.titleMedium)?.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: compact ? cardSize * 0.072 : cardSize * 0.078,
          );
          final unitStyle = textTheme.bodySmall?.copyWith(
            color: DripColors.greyText,
            fontWeight: FontWeight.w600,
            fontSize: dense ? cardSize * 0.041 : cardSize * 0.043,
          );

          return Container(
            decoration: BoxDecoration(
              color: DripColors.cardBg,
              borderRadius: borderRadius,
              border: Border.all(color: DripColors.greyText.withOpacity(0.16)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A000000),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: dense ? 50 : 48,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        _TopImage(
                          imageUrl: imageUrl,
                          image: image,
                          aspectRatio: imageAspectRatio,
                        ),
                        if (showLabel && label != null && label!.trim().isNotEmpty)
                          Positioned(
                            top: 10,
                            left: 10,
                            child: _Tag(
                              text: label!,
                              fontSize: dense ? cardSize * 0.035 : cardSize * 0.038,
                              verticalPadding: dense ? 3 : 4,
                              horizontalPadding: dense ? 8 : 10,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: dense ? 50 : 52,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        verticalPadding,
                        horizontalPadding,
                        verticalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                              productName,
                              maxLines: dense ? 1 : 2,
                              overflow: TextOverflow.ellipsis,
                              style: titleStyle,
                            ),
                          ),
                          if (showStore && store != null && store!.trim().isNotEmpty) ...[
                            SizedBox(height: labelSpacing),
                            Flexible(
                              child: Text(
                                store!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: storeStyle,
                              ),
                            ),
                          ],
                          SizedBox(height: innerSpacing),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        price,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: priceStyle,
                                      ),
                                    ),
                                    SizedBox(width: cardSize * 0.02),
                                    Text(
                                      '/ $unit',
                                      style: unitStyle,
                                    ),
                                  ],
                                ),
                              ),
                              if (showAddButton) ...[
                                SizedBox(width: cardSize * 0.03),
                                _CompactAddButton(
                                  onPressed: onAdd,
                                  size: buttonSize,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DripProductList extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget? separator;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const DripProductList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.separator,
    this.padding = EdgeInsets.zero,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      separatorBuilder: (_, __) => separator ?? const SizedBox(height: 12),
    );
  }
}

class DripProductGrid extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final int crossAxisCount;
  final double? cardMaxWidth;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;
  final double loadMoreOffset;
  final Widget? loadingIndicator;
  final Widget? emptyWidget;

  const DripProductGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.cardMaxWidth,
    this.childAspectRatio = 0.78,
    this.mainAxisSpacing = 14,
    this.crossAxisSpacing = 14,
    this.padding = EdgeInsets.zero,
    this.physics,
    this.shrinkWrap = false,
    this.hasMore = false,
    this.isLoadingMore = false,
    this.onLoadMore,
    this.loadMoreOffset = 240,
    this.loadingIndicator,
    this.emptyWidget,
  });

  @override
  State<DripProductGrid> createState() => _DripProductGridState();
}

class _DripProductGridState extends State<DripProductGrid> {
  bool _loadMoreRequested = false;

  @override
  void didUpdateWidget(covariant DripProductGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoadingMore != widget.isLoadingMore ||
        oldWidget.hasMore != widget.hasMore) {
      _loadMoreRequested = false;
    }
  }

  bool _handleScroll(ScrollNotification notification) {
    if (widget.onLoadMore == null || !widget.hasMore || widget.isLoadingMore) {
      return false;
    }

    final metrics = notification.metrics;
    if (metrics.maxScrollExtent <= 0) {
      return false;
    }

    final triggerPoint = metrics.maxScrollExtent - widget.loadMoreOffset;
    final shouldLoadMore = metrics.pixels >= triggerPoint;

    if (shouldLoadMore && !_loadMoreRequested) {
      _loadMoreRequested = true;
      widget.onLoadMore?.call();
    }

    if (!shouldLoadMore) {
      _loadMoreRequested = false;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0 && widget.emptyWidget != null) {
      return widget.emptyWidget!;
    }

    return NotificationListener<ScrollNotification>(
      onNotification: _handleScroll,
      child: GridView.builder(
        padding: widget.padding,
        physics: widget.physics,
        shrinkWrap: widget.shrinkWrap,
        itemCount: widget.itemCount + (widget.isLoadingMore ? 1 : 0),
        gridDelegate: widget.cardMaxWidth != null
            ? SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: widget.cardMaxWidth!,
                childAspectRatio: widget.childAspectRatio,
                mainAxisSpacing: widget.mainAxisSpacing,
                crossAxisSpacing: widget.crossAxisSpacing,
              )
            : SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                childAspectRatio: widget.childAspectRatio,
                mainAxisSpacing: widget.mainAxisSpacing,
                crossAxisSpacing: widget.crossAxisSpacing,
              ),
        itemBuilder: (context, index) {
          if (index >= widget.itemCount) {
            return widget.loadingIndicator ?? const _GridLoadingTile();
          }

          return widget.itemBuilder(context, index);
        },
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String? imageUrl;
  final Widget? image;

  const _ProductImage({
    required this.imageUrl,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final child = image ??
        (imageUrl != null && imageUrl!.trim().isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _placeholder(),
                ),
              )
            : _placeholder());

    return SizedBox(
      width: 84,
      height: 84,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          color: const Color(0xFFF3F4F6),
          child: child,
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: const Color(0xFFF3F4F6),
      alignment: Alignment.center,
      child: const Icon(
        Icons.shopping_bag_outlined,
        color: Color(0xFF9CA3AF),
        size: 30,
      ),
    );
  }
}

class _TopImage extends StatelessWidget {
  final String? imageUrl;
  final Widget? image;
  final double aspectRatio;

  const _TopImage({
    required this.imageUrl,
    required this.image,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final child = image ??
        (imageUrl != null && imageUrl!.trim().isNotEmpty
            ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(),
              )
            : _placeholder());

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        color: const Color(0xFFF3F4F6),
        child: child,
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: const Color(0xFFF3F4F6),
      alignment: Alignment.center,
      child: const Icon(
        Icons.shopping_bag_outlined,
        color: Color(0xFF9CA3AF),
        size: 34,
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;

  const _Tag({
    required this.text,
    this.fontSize = 12,
    this.horizontalPadding = 10,
    this.verticalPadding = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: DripColors.lime.withOpacity(0.26),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DripColors.lime,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(14),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Icon(
            Icons.add,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _CompactAddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  const _CompactAddButton({required this.onPressed, required this.size});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DripColors.lime,
      borderRadius: BorderRadius.circular(size * 0.28),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(size * 0.28),
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(
            Icons.add,
            size: size * 0.52,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _GridLoadingTile extends StatelessWidget {
  const _GridLoadingTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DripColors.cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: DripColors.greyText.withOpacity(0.16)),
      ),
      alignment: Alignment.center,
      child: const SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}