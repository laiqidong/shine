//package com.shine.service.impl;
//
//
//import com.shine.model.manage.UserEntity;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Component;
//
//import javax.annotation.Resource;
//import java.util.ArrayList;
//import java.util.List;
//
//@Component
//public class CustomUserServiceImpl implements UserDetailsService {
//    @Resource
//    private UserEntityRepository userEntityRepository;
//
//    @Resource
//    private PubUserRepository pubUserRepository;
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        UserEntity user = userEntityRepository.findByUsernameAndStatus(username,1);
////        PubUser pubUser = pubUserRepository.findByAccountAndStatus(username,1);
//        List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
//        if (user == null ) {
//            throw new UsernameNotFoundException("用户不存在");
//        }
////        if (user != null) {
//            list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
//            return new MyUserDetails(user.getUsername(), user.getPassword(), user.getStaffName(), user.getRoleId(), list);
////        }
////        else {
////            list.add(new SimpleGrantedAuthority("ROLE_USER"));
////            return new MyUserDetails(pubUser.getAccount(), pubUser.getPassword(), pubUser.getName(), null, list);
////        }
////        list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
//    }
//
////    @Override
////    public UserDetails loadPubUserByAccountAndPassword(String account,String password) throws UsernameNotFoundException{
////        PubUser user=pubUserRepository.selectUser(account,password);
////        List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
////        if (user == null) {
////            throw new UsernameNotFoundException("用户不存在");
////        }
////        list.add(new SimpleGrantedAuthority("ROLE_"+user.getRoleId()));
//////        list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
////        return new MyUserDetails(user.getAccount(),user.getPassword(),user.getStaffName(),user.getRoleId(),list);
////    }
//}