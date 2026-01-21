data "aws_iam_policy_document" "region01_bucket_policy" {
  statement {
    sid    = "Permissions on objects and buckets"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::cloudtrail-logs-stream-${var.region_1}-${random_id.id_1.dec}",
      "arn:aws:s3:::cloudtrail-logs-stream-${var.region_1}-${random_id.id_1.dec}/*"
    ]
    actions = [
      "s3:List*",
      "s3:GetBucketVersioning",
      "s3:PutBucketVersioning",
      "s3:ReplicateDelete",
      "s3:ReplicateObject",
    ]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::399013740692:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::626047985379:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::522740210697:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::990116904556:role/cloudtrail-replication-role",
        "arn:aws:iam::851424344156:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::112588975595:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::263262904113:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::552100103979:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::747930946173:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::262672224218:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::300315377102:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::823227099522:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::227121970444:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::834651181646:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::480490350404:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::336630521457:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::785571047831:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::855723777883:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::791922819456:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::195459522861:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::162651075161:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::592905856457:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::200419961741:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::468791509673:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::710274224436:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::254237123190:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::557574355096:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::655260106862:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::974075132125:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::263674916012:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::469241326169:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::434380778381:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::070913506331:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::708062173806:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::248694604842:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::507083270750:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::310115602267:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::955550033315:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::382587119353:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::232830849751:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::122426359918:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::771366737250:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::449184122535:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::411397445875:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::050973144856:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::781142674752:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::658989482604:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::838425584437:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::658225227524:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::058992062891:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::000426363556:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::107527883487:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::024848476787:role/cloudtrail-cross-account-replication-role"


      ]
    }
  }

  statement {
    sid       = "Permission to override bucket owner"
    effect    = "Allow"
    resources = ["arn:aws:s3:::cloudtrail-logs-stream-${var.region_1}-${random_id.id_1.dec}/*"]
    actions   = ["s3:ObjectOwnerOverrideToBucketOwner"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::399013740692:root",
        "arn:aws:iam::626047985379:root",
        "arn:aws:iam::522740210697:root",
        "arn:aws:iam::990116904556:root",
        "arn:aws:iam::851424344156:root",
        "arn:aws:iam::112588975595:root",
        "arn:aws:iam::263262904113:root",
        "arn:aws:iam::552100103979:root",
        "arn:aws:iam::747930946173:root",
        "arn:aws:iam::262672224218:root",
        "arn:aws:iam::300315377102:root",
        "arn:aws:iam::823227099522:root",
        "arn:aws:iam::227121970444:root",
        "arn:aws:iam::834651181646:root",
        "arn:aws:iam::480490350404:root",
        "arn:aws:iam::336630521457:root",
        "arn:aws:iam::785571047831:root",
        "arn:aws:iam::855723777883:root",
        "arn:aws:iam::791922819456:root",
        "arn:aws:iam::195459522861:root",
        "arn:aws:iam::162651075161:root",
        "arn:aws:iam::592905856457:root",
        "arn:aws:iam::200419961741:root",
        "arn:aws:iam::468791509673:root",
        "arn:aws:iam::710274224436:root",
        "arn:aws:iam::254237123190:root",
        "arn:aws:iam::557574355096:root",
        "arn:aws:iam::655260106862:root",
        "arn:aws:iam::974075132125:root",
        "arn:aws:iam::263674916012:root",
        "arn:aws:iam::469241326169:root",
        "arn:aws:iam::434380778381:root",
        "arn:aws:iam::070913506331:root",
        "arn:aws:iam::708062173806:root",
        "arn:aws:iam::248694604842:root",
        "arn:aws:iam::507083270750:root",
        "arn:aws:iam::310115602267:root",
        "arn:aws:iam::955550033315:root",
        "arn:aws:iam::382587119353:root",
        "arn:aws:iam::232830849751:root",
        "arn:aws:iam::122426359918:root",
        "arn:aws:iam::771366737250:root",
        "arn:aws:iam::449184122535:root",
        "arn:aws:iam::411397445875:root",
        "arn:aws:iam::050973144856:root",
        "arn:aws:iam::781142674752:root",
        "arn:aws:iam::658989482604:root",
        "arn:aws:iam::838425584437:root",
        "arn:aws:iam::658225227524:root",
        "arn:aws:iam::058992062891:root",
        "arn:aws:iam::000426363556:root",
        "arn:aws:iam::107527883487:root",
        "arn:aws:iam::024848476787:root"
      

      ]
    }
  }

  statement {
    effect    = "Allow"
    resources = ["arn:aws:s3:::cloudtrail-logs-stream-${var.region_1}-${random_id.id_1.dec}/*"]
    actions   = ["s3:GetObject"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::480490350404:user/cortexdr-logs-push"
      ]
    }
  }
}

data "aws_iam_policy_document" "region02_bucket_policy" {
  statement {
    sid    = "Permissions on objects and buckets"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::cloudtrail-logs-stream-${var.region_2}-${random_id.id_2.dec}",
      "arn:aws:s3:::cloudtrail-logs-stream-${var.region_2}-${random_id.id_2.dec}/*"
    ]

    actions = [
      "s3:List*",
      "s3:GetBucketVersioning",
      "s3:PutBucketVersioning",
      "s3:ReplicateDelete",
      "s3:ReplicateObject",
    ]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::399013740692:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::626047985379:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::522740210697:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::990116904556:role/cloudtrail-replication-role",
        "arn:aws:iam::851424344156:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::112588975595:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::263262904113:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::552100103979:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::747930946173:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::262672224218:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::300315377102:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::823227099522:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::227121970444:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::834651181646:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::480490350404:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::336630521457:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::785571047831:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::855723777883:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::791922819456:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::195459522861:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::162651075161:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::592905856457:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::200419961741:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::468791509673:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::710274224436:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::254237123190:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::557574355096:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::655260106862:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::974075132125:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::263674916012:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::469241326169:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::434380778381:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::070913506331:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::708062173806:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::248694604842:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::507083270750:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::310115602267:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::955550033315:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::382587119353:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::232830849751:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::122426359918:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::771366737250:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::449184122535:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::411397445875:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::050973144856:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::781142674752:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::658989482604:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::838425584437:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::658225227524:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::058992062891:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::000426363556:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::107527883487:role/cloudtrail-cross-account-replication-role",
        "arn:aws:iam::024848476787:role/cloudtrail-cross-account-replication-role"

      ]
    }
  }

  statement {
    sid       = "Permission to override bucket owner"
    effect    = "Allow"
    resources = ["arn:aws:s3:::cloudtrail-logs-stream-${var.region_2}-${random_id.id_2.dec}/*"]
    actions   = ["s3:ObjectOwnerOverrideToBucketOwner"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::399013740692:root",
        "arn:aws:iam::626047985379:root",
        "arn:aws:iam::522740210697:root",
        "arn:aws:iam::990116904556:root",
        "arn:aws:iam::851424344156:root",
        "arn:aws:iam::112588975595:root",
        "arn:aws:iam::263262904113:root",
        "arn:aws:iam::552100103979:root",
        "arn:aws:iam::747930946173:root",
        "arn:aws:iam::262672224218:root",
        "arn:aws:iam::300315377102:root",
        "arn:aws:iam::823227099522:root",
        "arn:aws:iam::227121970444:root",
        "arn:aws:iam::834651181646:root",
        "arn:aws:iam::480490350404:root",
        "arn:aws:iam::336630521457:root",
        "arn:aws:iam::785571047831:root",
        "arn:aws:iam::855723777883:root",
        "arn:aws:iam::791922819456:root",
        "arn:aws:iam::195459522861:root",
        "arn:aws:iam::162651075161:root",
        "arn:aws:iam::592905856457:root",
        "arn:aws:iam::200419961741:root",
        "arn:aws:iam::468791509673:root",
        "arn:aws:iam::710274224436:root",
        "arn:aws:iam::254237123190:root",
        "arn:aws:iam::557574355096:root",
        "arn:aws:iam::655260106862:root",
        "arn:aws:iam::974075132125:root",
        "arn:aws:iam::263674916012:root",
        "arn:aws:iam::469241326169:root",
        "arn:aws:iam::434380778381:root",
        "arn:aws:iam::070913506331:root",
        "arn:aws:iam::708062173806:root",
        "arn:aws:iam::248694604842:root",
        "arn:aws:iam::507083270750:root",
        "arn:aws:iam::310115602267:root",
        "arn:aws:iam::955550033315:root",
        "arn:aws:iam::382587119353:root",
        "arn:aws:iam::232830849751:root",
        "arn:aws:iam::122426359918:root",
        "arn:aws:iam::771366737250:root",
        "arn:aws:iam::449184122535:root",
        "arn:aws:iam::411397445875:root",
        "arn:aws:iam::050973144856:root",
        "arn:aws:iam::781142674752:root",
        "arn:aws:iam::658989482604:root",
        "arn:aws:iam::838425584437:root",
        "arn:aws:iam::658225227524:root",
        "arn:aws:iam::058992062891:root",
        "arn:aws:iam::000426363556:root",
        "arn:aws:iam::107527883487:root",
        "arn:aws:iam::024848476787:root"

      ]
    }
  }

  statement {
    effect    = "Allow"
    resources = ["arn:aws:s3:::cloudtrail-logs-stream-${var.region_2}-${random_id.id_2.dec}/*"]
    actions   = ["s3:GetObject"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::480490350404:user/cortexdr-logs-push"
      ]
    }
  }
}


