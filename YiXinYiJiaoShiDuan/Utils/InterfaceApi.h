//
//  InterfaceApi.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/16.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#ifndef InterfaceApi_h
#define InterfaceApi_h


//user
#define JZD_USER_API_SEND_MSG_CODE @"SendMessageCode"//发送短信验证码
#define JZD_USER_API_PARENT_LOGIN @"ParentLogin"//家长登录
#define JZD_USER_API_PARENT_CODE_LOGIN @"ParentCodeLogin"//家长验证码登录
#define JZD_USER_API_GET_STUDENT_INFO @"GetStudentByParent"//获取学生信息
#define JZD_USER_API_BIND_STUDENT @"BindStudentParent"//绑定学生
#define JZD_USER_API_GET_EXAMINATION @"GetExamination"//查分获取考试
#define JZD_USER_API_SUBMIT_MATERIAL @"SubmitMaterial"//教师子女
#define JZD_USER_API_EXAMINATION_PERFORMANCE @"GetExaminationPerformance"//考试查分

//home
#define JZD_HOME_API_GET_NOTICE @"GetNotice"//获取通知
#define JZD_HOME_API_DETAIL_NOTICE @"NoticeDetail"//通知详情
#define JZD_HOME_API_GET_ARTICLE @"GetArticle"//推荐内容
#define JZD_HOME_API_GET_ARTICLE_DETAIL @"FindArticle"//推荐详情
#define JZD_HOME_API_GET_BANNER @"GetBanner"//轮播图
#define JZD_HOME_API_GET_SUBJECT @"GetSubject"//获取学科信息
#define JZD_HOME_API_GET_COURSETIMEINTERVAL @"GetCourseTimeInterval"//选课获取期段
#define JZD_HOME_API_GET_CLASSBYSUBJECT @"GetClassBySubject"//选课获取班级
#define JZD_HOME_API_FIND_CLASSDETAIL @"FindClassDetail"//班级详情
#define JZD_HOME_API_GET_COURSEEVALUATE @"GetCourseEvaluate"//获取课程评价
#define JZD_HOME_API_GET_SCHOOL @"GetSchool"//获取校区
#define JZD_HOME_API_ADD_SHOPCAR @"AddShopCar"//添加购物车
#define JZD_HOME_API_GET_SHOPCAR_COURSE @"GetShopCarCourse"//获取课程清单

//serve
#define JZD_SERVE_API_GET_SCHOOL_LIST @"FindSchoolList"//校区分布
#define JZD_SERVE_API_GET_COURSE_LIST @"GetCourseTable"//获取课表
#define JZD_SERVE_API_GET_COURSE_BY_DAY @"GetStudentClassByDay"//获取学生某一天的课
#define JZD_SERVE_API_LEAVE_CLASS @"LeaveClass"//学生请假
#define JZD_SERVE_API_GET_CLASS_COMMENT @"GetClassComment"//课堂点评
#define JZD_SERVE_API_GET_COMMENT_DETAIL @"GetClassCommentDetail"//课堂点评详情
#define JZD_SERVE_API_GET_TEACHING_REPORT @"GetTeachingReport"//教学报告
#define JZD_SERVE_API_GET_TEACHING_REPORT_DETAIL @"GetTeachingReportDetail"//教学报告详情
#define JZD_SERVE_API_GET_STUDENT_ATTENDANCE @"GetStudentAttendance"//到课情况
#define JZD_SERVE_API_GET_STUDENT_CLASSOPEN_DETAIL @"GetStudentClassOpenDetail"//到课详情
#define JZD_SERVE_API_GET_CLASS_DYNAMIC @"GetClassDynamic"//获取班级动态

//message


#endif /* InterfaceApi_h */
