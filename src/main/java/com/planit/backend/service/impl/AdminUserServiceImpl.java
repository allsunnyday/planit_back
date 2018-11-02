package com.planit.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.planit.backend.service.AdminUserDTO;
import com.planit.backend.service.AdminUserService;

@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService{

   @Resource(name="adminUserDAO")
   private AdminUserDAO dao;

   @Override
   public List<AdminUserDTO> selectInfoList(Map map) {
      return dao.selectInfoList(map);
   }

   @Override
   public int getTotalCount(Map map) {
      return dao.getTotalCount(map);
   }

   @Override
   public AdminUserDTO selectOne(Map map) {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public int insert(AdminUserDTO dto) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int update(AdminUserDTO dto) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int delete(AdminUserDTO dto) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public List<AdminUserDTO> selectPlannerList(Map map) {
      return dao.selectPlannerList(map);
   }

   @Override
   public List<AdminUserDTO> selectReviewList(Map map) {
      return dao.selectReviewList(map);
   }

   @Override
   public List<AdminUserDTO> selectFavoriteList(Map map) {
      return dao.selectFavoriteList(map);
   }

   @Override
   public int genderCount(Map map) {
      return dao.genderCount(map);
   }

   @Override
   public int plannerCount(Map map) {
      return dao.plannerCount(map);
   }

   @Override
   public int memberCount(Map map) {
      return dao.memberCount(map);
   }

   @Override
   public int noticeCount(Map map) {
      return dao.noticeCount(map);
   }

   @Override
   public List<AdminUserDTO> hotTourList(Map map) {
      return dao.hotTourList(map);
   }
   @Override
   public List<AdminUserDTO> hotPlannerList(Map map) {
      return dao.hotPlannerList(map);
   }
   @Override
   public List<AdminUserDTO> hotReviewList(Map map) {
      return dao.hotReviewList(map);
   }

   @Override
   public List<AdminUserDTO> selectAgeList(Map map) {
      return dao.selectAgeList(map);
   }

   @Override
   public int reviewCount(Map map) {
      return dao.reviewCount(map);
   }

   
   

}